import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  //final int correctAnswers;

//fix up colors for circle avatar
  // final correctAnswer = summaryData.where((data) {
  //   return

  // });

  @override
  Widget build(BuildContext context) {
    // var userAns;
    // var corAns;
    // summaryData.where((data) {
    //   userAns = data['user_answers'];
    //   corAns = data['correct_answers'];
    //   return corAns;
    //   //return data['user_answers'] == data['correct_answers'];
    // });
    // //
    // summaryData.where((data) {
    //   userAns = data['user_answers'];
    //   corAns = data['correct_answers'];
    //   return userAns;
    //   //return data['user_answers'] == data['correct_answers'];
    // });

    // print(correctAnswers);
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor:
                        // data['user_answers'] != data['correct_answers']
                        //     ? const Color.fromARGB(255, 213, 113, 106)
                        //     : const Color.fromARGB(255, 125, 217, 128),
                        data['user_answers'] == data['correct_answers']
                            ? const Color.fromARGB(255, 125, 217, 128)
                            : const Color.fromARGB(255, 213, 113, 106),
                    radius: 15,
                    child:
                        Text(((data["question_index"] as int) + 1).toString()),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          // overflow: TextOverflow.clip,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // const SizedBox(height: 5),
                        Text(
                          'correct answer: ${data['correct_answers'] as String} ',
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(219, 239, 131, 243),
                          ),
                        ),
                        Text(
                          data['user_answers'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
