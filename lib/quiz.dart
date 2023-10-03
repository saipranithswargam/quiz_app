import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  // Widget? activeScreen; // ?  null or something
  // Widget activeScreen = StartScreen(switchScreen);
  // this above we cannot use since we cannot reference the function before object is made i.e., almost at the same time both reference is passed as well as function is defined so we need to  pass it thorught init method
  // void initState() {
  //   //this is a method executed once after the object has been created and then never execute there after
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  //to avoid init and all we can use ternery operator for switching screens

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        //without this what happens is the list will have previous answers and is user tries to play again after going to home page it will give error when he plays the game for second time
        activeScreen = 'results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void quizRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswers);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(selectedAnswers, quizRestart);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
