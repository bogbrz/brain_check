import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:html_unescape/html_unescape.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.choosedQuestion,
    required this.isCorrect,
    required this.option,
    required this.answers,
    required this.screenWidth,
    required this.screenHeight,
  });

  final dynamic choosedQuestion;
  final bool isCorrect;
  final String option;
  final List<String> answers;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: choosedQuestion == null
                ? Colors.white
                : isCorrect && option == answers[choosedQuestion]
                    ? Colors.green
                    : isCorrect == false && option == answers[choosedQuestion]
                        ? Colors.red
                        : Colors.white,
            border: Border.all(width: 8, color: Colors.black)),
        width: screenWidth * 0.2,
        height: screenHeight * 0.2,
        child: Text(
          HtmlUnescape().convert(option),
          style: GoogleFonts.bungee(fontSize: 20),
          textAlign: TextAlign.center,
        ));
  }
}
