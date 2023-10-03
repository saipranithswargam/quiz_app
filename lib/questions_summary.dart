import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary(this.summaryData, {super.key});
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: data['user_answer'] == data['correct-answer']
                        ? Colors.green.shade400
                        : Colors.red.shade400,
                  ),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                    //it makes its child take vailable space which parent of expanded takes (i.e., row or column in wch expanded is there)
                    //and by default maxm width of row widget is maxm screen width
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //column takes an infinite amount of width even if that goes beyond the screen boundary
                  children: [
                    Text(
                      data['question'] as String,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data['user_answer'] as String,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data['correct-answer'] as String,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 141, 214, 145),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ))
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
