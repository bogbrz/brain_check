import 'package:brain_check/amount_list.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/cubit%20copy/token_cubit_cubit.dart';

import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/difficulty_list.dart';
import 'package:brain_check/domain/models/categories_model.dart';

import 'package:brain_check/features/pages/difficulty_page/cubit/difficulty_page_cubit.dart';
import 'package:brain_check/features/pages/question_page/question_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
  var questionsNumber = null;

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
                    return InitialStateWidget();
                  case Status.loading:
                    return LoadingStateWidget();
                  case Status.error:
                    return ErrorStateWidget(
                        errorMessage: state.errorMessage.toString());
                  case Status.success:
                    return Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Padding(
                              padding: const EdgeInsets.all(20),
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
                                              "Choosed category: ${widget.categoriesModel.name}",
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
                                                      "Amount questions in this category: ${state.overAll.totalNumOfVerifiedQuestions}",
                                                      style: GoogleFonts.bungee(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            45,
                                                      ),
                                                    )
                                                  : Text(
                                                      "Amount questions in this category: ${state.info!.totalQuestionCount} ",
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
                                                  ? "Choose difficulty: not choosen"
                                                  : choosedDifficulty ==
                                                          null.toString()
                                                      ? "Choose difficulty: random"
                                                      : "Choose difficulty: $choosedDifficulty",
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
                                                  ? "Amount of rounds: not choosen"
                                                  : questionsNumber == 0
                                                      ? "Amount of rounds: Survival"
                                                      : "Amount of rounds: $questionsNumber",
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
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (final difficulty in difficulties) ...[
                                  Material(
                                    shape: const OutlineInputBorder(),
                                    clipBehavior: Clip.hardEdge,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          choosedDifficulty = difficulty.nameId;
                                          print(choosedDifficulty);
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    55),
                                            color: difficulty.color),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              difficulty.name,
                                              style: GoogleFonts.bungee(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    45,
                                              ),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    10,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    10,
                                                child: difficulty.icon),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  55,
                                            ),
                                            color: Colors.blue,
                                          ),
                                          child: Text(
                                            amount.name,
                                            style: GoogleFonts.bungee(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  25,
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
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
                                    await context
                                        .read<TokenCubitCubit>()
                                        .fetchToken();

                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: ((context) => QuestionPage(
                                                  token: state.tokenModel.token
                                                      .toString(),
                                                  user: widget.user,
                                                  category:
                                                      widget.categoriesModel.id,
                                                  difficulty: choosedDifficulty,
                                                  questionsNumber:
                                                      questionsNumber,
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
