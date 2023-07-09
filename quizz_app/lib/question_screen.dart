import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/models/quiz_questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectAnswer, super.key});

  final void Function(String answers) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() {
      // widget.onSelectAnswer(selectedAnswer);
      currentQuestionIndex++;
    });
  }
  //access the questions List
  //final currentQuestion = questions[0];

  @override
  Widget build(BuildContext context) {
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
            //map the list of answers to AnserButton

            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answer: answer,
                onTap: () {
                  print(":::::$answer:::::");
                  //print(":::::${currentQuestion.answers}:::::"); //prints same format
                  answerQuestion(answer);
                  widget.onSelectAnswer(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

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
