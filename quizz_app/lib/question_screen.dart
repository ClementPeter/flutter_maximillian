import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/models/quiz_questions.dart';

//Displays question and answer buttons
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectAnswer, super.key});

  final void Function(String answers) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  //dynamically incrementing the current question and answers
  int currentQuestionIndex = 0;

  //performs function after question is answered
  //incrementing and passing selected answer to list of answered questions
  void answerQuestion(String selectedAnswer) {
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //access the questions List
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                currentQuestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 30),
            //map the list of answers to AnswerButton
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answer: answer,
                onTap: () {
                  // print("::answer button clicked:::$answer:::::");
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

//reusable button
class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answer,
    required this.onTap,
  });

  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        //padding:  const EdgeInset.styleFrom()
        backgroundColor: const Color.fromARGB(255, 33, 1, 95), //
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(),
      ),
    );
  }
}
