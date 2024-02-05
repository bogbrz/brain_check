import 'package:brain_check/app/injection_container.dart';

import 'package:brain_check/features/pages/question_page/question_page.dart';
import 'package:brain_check/features/pages/result_page/cubit/result_page_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.widget,
    required this.index,
    required this.points,
  });

  final QuestionPage widget;
  final int index;

  final int points;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResultPageCubit>()
        ..getRankingForUpdate(email: widget.user!.email.toString()),
      child: Scaffold(
        body: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: MediaQuery.of(context).size.width / 55,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  widget.questionsNumber != 0 && index == widget.questionsNumber
                      ? "Your Score $points/$index"
                      : "Your Score $points",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bungee(
                    fontSize: MediaQuery.of(context).size.height / 35,
                  )),
              Material(
                clipBehavior: Clip.hardEdge,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BlocBuilder<ResultPageCubit, ResultPageState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        for (final profile in state.profile) {
                          context
                              .read<ResultPageCubit>()
                              .updateRanking(points: points, id: profile.id);
                        }

                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 27, 58, 93),
                            border: Border.all(
                              width: MediaQuery.of(context).size.width / 55,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "FINISH",
                          style: GoogleFonts.bungee(
                              fontSize: MediaQuery.of(context).size.height / 25,
                              color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
