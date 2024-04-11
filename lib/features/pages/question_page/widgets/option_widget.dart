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
            border: Border.all(width: MediaQuery.of(context).size.width / 55),
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
              MediaQuery.of(context).size.height * 0.007),
          width: MediaQuery.of(context).size.width * 0.47,
          height: MediaQuery.of(context).size.height * 0.2,
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
                            size: MediaQuery.of(context).size.height * 0.035,
                          )
                        : isChoosed && answer == correctAnswer
                            ? Icon(
                                Icons.check,
                                size:
                                    MediaQuery.of(context).size.height * 0.035,
                              )
                            : SizedBox.shrink()
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Text(answer,
                  style: GoogleFonts.bungee(
                    fontSize: MediaQuery.of(context).size.height / 60,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
            ],
          ))),
    );
  }
}
