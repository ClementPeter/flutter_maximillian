// import 'package:flutter/material.dart';
// import 'package:quizz_app/question_screen.dart';
// import 'package:quizz_app/start_screen.dart';

// //Top most parent widget that passes state changes to start and question screen
// //Quiz.dart contains UI background for all the other screens
// class Quiz extends StatefulWidget {
//   const Quiz({super.key});

//   @override
//   State<Quiz> createState() => _QuizState();
// }

// class _QuizState extends State<Quiz> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Quizz App',
//       theme: ThemeData(
//         //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 168, 47, 190),
//                 Color.fromARGB(255, 97, 53, 172),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           // child: StartScreen(() {}),
//           child: QuestionsScreen(),
//         ),
//       ),
//     );
//   }
// }
