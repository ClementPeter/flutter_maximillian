import 'package:flutter/material.dart';
import 'package:quizz_app/quiz.dart';
import 'package:quizz_app/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Quizz App',
    //   theme: ThemeData(
    //     //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //  // home: Quiz()
    //   // home: Scaffold(
    //   //   body: Container(
    //   //     decoration: const BoxDecoration(
    //   //       gradient: LinearGradient(
    //   //         colors: [
    //   //           Color.fromARGB(255, 168, 47, 190),
    //   //           Color.fromARGB(255, 97, 53, 172),
    //   //         ],
    //   //         begin: Alignment.topLeft,
    //   //         end: Alignment.bottomRight,
    //   //       ),
    //   //     ),
    //   //     child:  StartScreen(),
    //   //   ),
    //   // ),
    // );
    return Quiz();
  }
}
