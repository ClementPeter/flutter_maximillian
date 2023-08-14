import 'package:flutter/material.dart';
import 'package:quizz_app/models/quiz_questions.dart';
import 'package:quizz_app/screens/question_screen.dart';
import 'package:quizz_app/screens/result_screen.dart';
import 'package:quizz_app/screens/start_screen.dart';
// import 'package:quizz_app/result_screen.dart';
// import 'package:quizz_app/start_screen.dart';

//Top most parent widget that passes state changes to Start Screen and question screen
//Contains UI background for all the other screens
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start_screen';

  //Holds selected answers from Question screen - passes it's data to result screen
  List<String> selectedAnswers = [];

  //will be passed to Start Screen - Lifting state up
  void switchScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  //will be passed to Question Screen - Lifting state up
  //add answered question from question screen
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result_screen';
      });
    }
    //print(":selected answers:::$selectedAnswers::::");
  }

  void resetQuiz() {
    //Removing this causes range error since app wont know when to reset quiz content to empty
    selectedAnswers.clear();
    //print(selectedAnswers);
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    //holds the current rendered screen
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question_screen') {
      setState(() {
        screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
      });
    }
    if (activeScreen == 'result_screen') {
      setState(() {
        screenWidget = ResultScreen(
          resetQuiz,
          chosenAnswers: selectedAnswers,
        );
      });
    }
    return MaterialApp(
      title: 'Quizz App',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 168, 47, 190),
                Color.fromARGB(255, 97, 53, 172),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
