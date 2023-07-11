import 'package:flutter/material.dart';

//Contains the question number and toggles the color
class QuestionIdentifer extends StatelessWidget {
  const QuestionIdentifer(this.questionIndex, this.isCorrectAnswer,
      {super.key});
  final bool isCorrectAnswer;
  final int questionIndex;
  @override
  Widget build(BuildContext context) {
    int quizNumber = questionIndex + 1;
    return CircleAvatar(
      backgroundColor: isCorrectAnswer
          ? const Color.fromARGB(255, 125, 217, 128)
          : const Color.fromARGB(255, 213, 113, 106),
      child: Text(
        quizNumber.toString(),
      ),
    );
  }
}
