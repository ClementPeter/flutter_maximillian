import 'package:flutter/material.dart';
import 'package:quizz_app/quiz.dart';
//import 'package:quizz_app/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Quiz(),
    );
  }
}
