class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final List<String> copiedAnswers = List.of(answers);
    copiedAnswers.shuffle();
    return copiedAnswers;
  }
}
