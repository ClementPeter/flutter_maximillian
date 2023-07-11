import 'package:flutter/material.dart';

import 'package:quizz_app/question_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(itemData: data);
          }).toList(),
        ),
      ),
    );
  }
}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//Commenting question_identifier ,and summary_item to use the snippet below

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class QuestionsSummary extends StatelessWidget {
//   const QuestionsSummary({required this.summaryData, super.key});

//   final List<Map<String, Object>> summaryData;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: SingleChildScrollView(
//         child: Column(
//           //map summary data to widgets
//           children: summaryData.map((data) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     backgroundColor:
//                         data['user_answers'] == data['correct_answers']
//                             ? const Color.fromARGB(255, 125, 217, 128)
//                             : const Color.fromARGB(255, 213, 113, 106),
//                     radius: 15,
//                     child:
//                         Text(((data["question_index"] as int) + 1).toString()),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           data['question'] as String,
//                           style: GoogleFonts.lato(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'correct answer: ${data['correct_answers'] as String} ',
//                           style: GoogleFonts.lato(
//                             color: const Color.fromARGB(219, 239, 131, 243),
//                           ),
//                         ),
//                         Text(
//                           data['user_answers'] as String,
//                           style: GoogleFonts.lato(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
