import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String _activeScreen = 'home-screen';
  final List<String> _selectedAnswers = [];

  void _switchScreen() {
    setState(() {
      _activeScreen = 'question-screen';
    });
  }

  void _addAnswer(String asnwer) {
    _selectedAnswers.add(asnwer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedAnswers.clear();
      _activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget = _activeScreen == 'home-screen'
        ? HomeScreen(_switchScreen)
        : _activeScreen == 'results-screen'
            ? ResultsScreen(_selectedAnswers, _restartQuiz)
            : QuestionsScreen(_addAnswer);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer.purple(
          child: screenWidget,
        ),
      ),
    );
  }
}
