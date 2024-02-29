import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';

import 'package:brain_check/features/pages/question_page/question_page.dart';
import 'package:brain_check/features/pages/result_page/cubit/result_page_cubit.dart';
import 'package:brain_check/features/pages/result_page/widgets/button_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    required this.questionPage,
    required this.index,
    super.key,
    required this.points,
    required this.isRanked,
  });

  final QuestionPage questionPage;
  final int index;

  final int points;
  final bool isRanked;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResultPageCubit>()
        ..getRankingForUpdate(email: questionPage.user!.email.toString()),
      child: Scaffold(
        body: Center(child: BlocBuilder<ResultPageCubit, ResultPageState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return const InitialStateWidget();
              case Status.loading:
                return const LoadingStateWidget();
              case Status.error:
                return ErrorStateWidget(
                    errorMessage: state.errorMessage.toString());
              case Status.success:
                return Container(
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
                          questionPage.questionsNumber != 0 &&
                                  index == questionPage.questionsNumber
                              ? "Your Score $points/$index"
                              : "Your Score $points",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 35,
                          )),
                      FinishButtonWidget(
                        isRanked: isRanked ,
                        points: points,
                        profiles: state.profile,
                      )
                    ],
                  ),
                );
            }
          },
        )),
      ),
    );
  }
}
