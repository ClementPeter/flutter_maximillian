import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/screens/question_summary/question_identifier.dart';

//Question_id and Text content
class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemData});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final int questionIndex = itemData['question_index'] as int;
    final correctAnswer =
        itemData['user_answers'] == itemData['correct_answers'];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifer(questionIndex, correctAnswer),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'correct answer: ${itemData['correct_answers']}',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(219, 239, 131, 243),
                  ),
                ),
                Text(
                  '${itemData['user_answers']}',
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
  }
}
