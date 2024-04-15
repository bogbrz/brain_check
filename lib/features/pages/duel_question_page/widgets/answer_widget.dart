import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    super.key,
    required this.answer,
    required this.correctAnswer,
    required this.choosedAnswer,
    required this.isChoosed,
  });
  final String choosedAnswer;

  final String answer;

  final String correctAnswer;
  final bool isChoosed;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                choosedAnswer.isEmpty && isChoosed == false
                    ? Colors.white
                    : choosedAnswer == correctAnswer &&
                                choosedAnswer == answer &&
                                isChoosed == true ||
                            choosedAnswer != answer &&
                                choosedAnswer != correctAnswer &&
                                answer == correctAnswer
                        ? Colors.green
                        : choosedAnswer == answer &&
                                choosedAnswer != correctAnswer &&
                                isChoosed == true
                            ? Colors.red
                            : Colors.white,
                Color.fromARGB(180, 66, 120, 255),
              ],
            ),
            color: choosedAnswer.isEmpty && isChoosed == false
                ? Colors.white
                : choosedAnswer == correctAnswer &&
                            choosedAnswer == answer &&
                            isChoosed == true ||
                        choosedAnswer != answer &&
                            choosedAnswer != correctAnswer &&
                            answer == correctAnswer
                    ? Colors.green
                    : choosedAnswer == answer &&
                            choosedAnswer != correctAnswer &&
                            isChoosed == true
                        ? Colors.red
                        : Colors.white,
          ),
          margin: EdgeInsetsDirectional.all(
              MediaQuery.of(context).size.height * 0.005),
          width: MediaQuery.of(context).size.width * 0.47,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    isChoosed &&
                            choosedAnswer == answer &&
                            choosedAnswer != correctAnswer
                        ? Icon(
                            Icons.cancel_outlined,
                            size: 30,
                          )
                        : isChoosed && answer == correctAnswer
                            ? Icon(
                                Icons.check,
                                size: 30,
                              )
                            : SizedBox.shrink()
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Text(answer,
                  style: GoogleFonts.bungee(
                    fontSize: MediaQuery.of(context).size.height / 55,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
            ],
          ))),
    );
  }
}
