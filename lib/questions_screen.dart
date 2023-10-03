import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onSelectedAnswer;
  const QuestionsScreen(this.onSelectedAnswer, {super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String answer) {
    setState(() {
      widget.onSelectedAnswer(answer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double
          .infinity, //use as much width as you can that is similar to 100vw;
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //this is similar to flexbox
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //this makes the items inside the column to stretch as wide as possible
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (item) {
                return AnswerButton(
                  item,
                  () {
                    answerQuestion(item);
                  },
                );
              },
            )
            //here unlike react list of widgets are not automatically taken and we need to use spread operator to get those individually
          ],
        ),
      ),
    );
  }
}
