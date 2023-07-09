import 'package:flutter/material.dart';
//import 'package:quizz_app/quiz.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});

  final VoidCallback startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz_logo.png",
            color: const Color.fromARGB(150, 255, 255, 255),
            width: 250,
          ),
          const SizedBox(height: 10),
          const Text(
            "Learn the Fun Way",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            // onPressed: () {
            //   startQuiz();
            // },
            onPressed: startQuiz, //indiretly calls switch screen
            label: const Text("Start Quiz"),
          )
        ],
      ),
    );
  }
}
