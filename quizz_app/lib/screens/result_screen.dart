import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/models/quiz_questions.dart';
import 'package:quizz_app/screens/question_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.resetQuiz, {required this.chosenAnswers, super.key});

  final void Function() resetQuiz;

  //passing data from selectedAnswers to chosenAnswers
  final List<String> chosenAnswers;

  //prepare the content to be used in question summary screen
  //get the contents for result screen to a Map - used to populate QuestionSummary
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answers": questions[i].answers[0],
        "user_answers": chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numTotalQuestions = questions.length;
    int numofCorrectAnswers = summaryData.where((data) {
      return data['user_answers'] == data['correct_answers'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'You answered $numofCorrectAnswers of $numTotalQuestions question(s)',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 50),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              //calls resetQuiz from quiz.dart screen -lifting state up
              onPressed: resetQuiz,
              icon: const Icon(Icons.refresh),
              label: const Text("Reset Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
