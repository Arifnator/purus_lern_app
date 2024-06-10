class Quiz {
  int id;
  int lexikonId;
  String question;
  List<String> answers;
  int correctAnswerIndex;

  Quiz({
    required this.id,
    required this.lexikonId,
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
  });

  bool checkAnswer(int answerIndex) {
    return answerIndex == correctAnswerIndex;
  }

  void displayQuizInfo() {
    print('Quiz: $question');
    for (int i = 0; i < answers.length; i++) {
      print('${i + 1}. ${answers[i]}');
    }
  }
}
