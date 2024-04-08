import 'package:brain_check/amount_list.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/cubit%20copy/token_cubit_cubit.dart';

import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/difficulty_list.dart';
import 'package:brain_check/domain/models/amount_button_model.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/difficulty_model.dart';

import 'package:brain_check/features/pages/difficulty_page/cubit/difficulty_page_cubit.dart';
import 'package:brain_check/features/pages/question_page/question_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DifficultyPage extends StatefulWidget {
  const DifficultyPage({
    required this.categoriesModel,
    required this.user,
    super.key,
  });

  final TriviaCategory categoriesModel;
  final User? user;

  @override
  State<DifficultyPage> createState() => _DifficultyPageState();
}

class _DifficultyPageState extends State<DifficultyPage> {
  var choosedDifficulty = '';
  var questionsNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<DifficultyPageCubit>()
          ..getCategoryInfo(category: widget.categoriesModel.id),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "BRAIN CHECK APP",
              style: GoogleFonts.bungee(
                  fontSize: MediaQuery.of(context).size.height / 30,
                  color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(255, 27, 58, 93),
          ),
          body: SafeArea(
            child: BlocBuilder<DifficultyPageCubit, DifficultyPageState>(
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
                    return Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: MediaQuery.of(context).size.width /
                                          55,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.38,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${AppLocalizations.of(context).choosedCategory}: ${widget.categoriesModel.name}",
                                              style: GoogleFonts.bungee(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    45,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: widget
                                                          .categoriesModel.id ==
                                                      0
                                                  ? Text(
                                                      "${AppLocalizations.of(context).questionsAmount}: ${state.overAll.totalNumOfVerifiedQuestions}",
                                                      style: GoogleFonts.bungee(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            45,
                                                      ),
                                                    )
                                                  : Text(
                                                      "${AppLocalizations.of(context).questionsAmount}: ${state.info!.totalQuestionCount} ",
                                                      style: GoogleFonts.bungee(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            45,
                                                      ),
                                                    )),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              choosedDifficulty.isEmpty
                                                  ? "${AppLocalizations.of(context).choosedDifficulty}: ${AppLocalizations.of(context).notChoosen}"
                                                  : choosedDifficulty ==
                                                          null.toString()
                                                      ? "${AppLocalizations.of(context).choosedDifficulty}: ${AppLocalizations.of(context).random}"
                                                      : "${AppLocalizations.of(context).choosedDifficulty}: $choosedDifficulty",
                                              style: GoogleFonts.bungee(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    45,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              questionsNumber == null
                                                  ? "${AppLocalizations.of(context).roundsAmount}: ${AppLocalizations.of(context).notChoosen}"
                                                  : questionsNumber == 0
                                                      ? "${AppLocalizations.of(context).roundsAmount}: ${AppLocalizations.of(context).survival}"
                                                      : "${AppLocalizations.of(context).roundsAmount}: $questionsNumber",
                                              style: GoogleFonts.bungee(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    45,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    for (final difficulty in difficulties) ...[
                                      Material(
                                        shape: const OutlineInputBorder(),
                                        clipBehavior: Clip.hardEdge,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              choosedDifficulty =
                                                  difficulty.nameId;
                                              print(choosedDifficulty);
                                            });
                                          },
                                          child: DifficultyWidget(
                                              choosedDifficulty:
                                                  choosedDifficulty,
                                              difficulty: difficulty),
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (final amount in amountButtons) ...[
                                      Material(
                                        shape: const OutlineInputBorder(),
                                        clipBehavior: Clip.hardEdge,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              questionsNumber = amount.nameId;
                                              print(questionsNumber);
                                            });
                                          },
                                          child: AmountWidget(
                                            amount: amount,
                                            choosedAmount: questionsNumber,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Material(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            clipBehavior: Clip.hardEdge,
                            child:
                                BlocBuilder<TokenCubitCubit, TokenCubitState>(
                              builder: (context, state) {
                                return InkWell(
                                  onTap: () async {
                                    print(widget.categoriesModel.id);
                                   

                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: ((context) => QuestionPage(
                                            
                                              roomId: null,
                                                  category:
                                                      widget.categoriesModel.id,
                                                  difficulty: choosedDifficulty,
                                                  user: widget.user,
                                                  questionsAmount:
                                                      questionsNumber,
                                                  gameType: GameType.casual,
                                                ))));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                55,
                                      ),
                                    ),
                                    child: Text(
                                      "START",
                                      style: GoogleFonts.bungee(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                25,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ]));
                }
              },
            ),
          ),
        ));
  }
}

class AmountWidget extends StatelessWidget {
  const AmountWidget({
    super.key,
    required this.amount,
    required this.choosedAmount,
  });

  final AmountModel amount;
  final int? choosedAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: choosedAmount == null
            ? MediaQuery.of(context).size.height * 0.1
            : choosedAmount == amount.nameId
                ? MediaQuery.of(context).size.height * 0.15
                : MediaQuery.of(context).size.height * 0.1,
        width: choosedAmount == null
            ? MediaQuery.of(context).size.width * 0.25
            : choosedAmount == amount.nameId
                ? MediaQuery.of(context).size.width * 0.35
                : MediaQuery.of(context).size.width * 0.21,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: MediaQuery.of(context).size.width / 55,
          ),
          color: Colors.blue,
        ),
        child: Text(
          amount.name == "Survival"
              ? AppLocalizations.of(context).survival
              : amount.name,
          style: GoogleFonts.bungee(
              fontSize: choosedAmount == null
                  ? MediaQuery.of(context).size.width / 35
                  : choosedAmount == amount.nameId && amount.nameId != 0
                      ? MediaQuery.of(context).size.width / 10
                      : choosedAmount == amount.nameId && amount.nameId == 0
                          ? MediaQuery.of(context).size.width / 20
                          : MediaQuery.of(context).size.width / 35),
        ));
  }
}

class DifficultyWidget extends StatelessWidget {
  const DifficultyWidget({
    super.key,
    required this.difficulty,
    required this.choosedDifficulty,
  });

  final DifficultyModel difficulty;
  final String choosedDifficulty;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: choosedDifficulty == ""
          ? MediaQuery.of(context).size.height * 0.1
          : choosedDifficulty == difficulty.nameId
              ? MediaQuery.of(context).size.height * 0.15
              : MediaQuery.of(context).size.height * 0.1,
      width: choosedDifficulty == ""
          ? MediaQuery.of(context).size.width * 0.25
          : choosedDifficulty == difficulty.nameId
              ? MediaQuery.of(context).size.width * 0.35
              : MediaQuery.of(context).size.width * 0.21,
      decoration: BoxDecoration(
          border: Border.all(width: MediaQuery.of(context).size.width / 55),
          color: difficulty.color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            difficulty.name == "Easy"
                ? AppLocalizations.of(context).easy
                : difficulty.name == "Medium"
                    ? AppLocalizations.of(context).medium
                    : difficulty.name == "Random"
                        ? AppLocalizations.of(context).random
                        : AppLocalizations.of(context).hard,
            style: GoogleFonts.bungee(
              fontSize: choosedDifficulty == ''
                  ? MediaQuery.of(context).size.width / 25
                  : choosedDifficulty == difficulty.nameId
                      ? MediaQuery.of(context).size.width / 15
                      : MediaQuery.of(context).size.width / 35,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: difficulty.icon,
            ),
          ),
        ],
      ),
    );
  }
}
