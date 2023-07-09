class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  //create a shuffled list of answers from the original List
  List<String> getShuffledAnswers() {
    //  final shuffledList = List.of(answers);
    //   shuffledList.shuffle();
    //   return shuffledList;

    //OR

    final cloneAnswerList = List.of(answers);
    cloneAnswerList.shuffle();
    List<String> shuffledLAnswerList = cloneAnswerList;
    return shuffledLAnswerList;
  }
}
