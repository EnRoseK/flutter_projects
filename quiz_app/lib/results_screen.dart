import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this._chosenAnswers, this.restartQuiz, {super.key});

  final List<String> _chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < _chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'chosen_answer': _chosenAnswers[i],
        'correct_answer': questions[i].answers[0]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryData = getSummaryData();
    final int totalQuestions = questions.length;
    final int correctAnswers = summaryData
        .where((data) => data['chosen_answer'] == data['correct_answer'])
        .length;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $correctAnswers out of $totalQuestions questions correctly!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, .8),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          QUestionSummary(summaryData),
          const SizedBox(height: 30),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: restartQuiz,
            label: const Text('Restart Quiz'),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
