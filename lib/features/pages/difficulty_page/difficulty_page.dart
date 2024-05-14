import 'package:brain_check/features/pages/difficulty_page/amount_list.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/difficulty_page/difficulty_list.dart';
import 'package:brain_check/domain/models/difficulty_page_route_model.dart';
import 'package:brain_check/domain/models/question_page_route_model.dart';
import 'package:brain_check/features/pages/difficulty_page/cubit/difficulty_page_cubit.dart';
import 'package:brain_check/features/pages/difficulty_page/widgets/amount_widget.dart';
import 'package:brain_check/features/pages/difficulty_page/widgets/difficulty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DifficultyPage extends StatefulWidget {
  const DifficultyPage({

    required this.model,
    super.key,
  });

  final DifficultyRouteModel model;



  @override
  State<DifficultyPage> createState() => _DifficultyPageState();
}

class _DifficultyPageState extends State<DifficultyPage> {
  var choosedDifficulty = '';
  // ignore: prefer_typing_uninitialized_variables
  var questionsNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<DifficultyPageCubit>()
          ..getCategoryInfo(category: widget.model.category.id),
        child: Scaffold(
          body: BlocBuilder<DifficultyPageCubit, DifficultyPageState>(
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
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.pop();
                                },
                                icon: const Icon(Icons.arrow_back_sharp),
                                color: Colors.white,
                                iconSize:
                                    MediaQuery.of(context).size.height * 0.05,
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.025),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 159, 177, 240),
                                    Color.fromARGB(180, 66, 120, 255),
                                  ],
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.38,
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
                                            "${AppLocalizations.of(context).choosedCategory}: ${widget.model.category.name}",
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
                                            child: widget.model.category.id == 0
                                                ? Text(
                                                    "${AppLocalizations.of(context).questionsAmount}: ${state.overAll.totalNumOfVerifiedQuestions}",
                                                    style: GoogleFonts.bungee(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              45,
                                                    ),
                                                  )
                                                : Text(
                                                    "${AppLocalizations.of(context).questionsAmount}: ${state.info!.totalQuestionCount} ",
                                                    style: GoogleFonts.bungee(
                                                      fontSize:
                                                          MediaQuery.of(context)
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
                                      borderRadius: BorderRadius.circular(20),
                                      clipBehavior: Clip.hardEdge,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            choosedDifficulty =
                                                difficulty.nameId;
                                        
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
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (final amount in amountButtons) ...[
                                    Material(
                                      clipBehavior: Clip.hardEdge,
                                      borderRadius: BorderRadius.circular(20),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            questionsNumber = amount.nameId;
                                         
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: choosedDifficulty.isEmpty ||
                                    questionsNumber == null
                                ? null
                                : () {
                                    context
                                        .read<DifficultyPageCubit>()
                                        .setStartTime(
                                            playerId:
                                                widget.model.profileModel.id);
                                    context.pushNamed(
                                      "/questionPage",
                                      extra: QuestionPageRouteModel(
                                          user: widget.model.user,
                                          profileModel:
                                              widget.model.profileModel,
                                          categoryId: widget.model.category.id,
                                          questionAmount: questionsNumber,
                                          difficulty:
                                              choosedDifficulty != "null"
                                                  ? choosedDifficulty
                                                  : null,
                                          gameType: GameType.casual),
                                    );

                                   
                                  },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 255, 255, 255),
                                    Color.fromARGB(180, 66, 120, 255),
                                  ],
                                ),
                              ),
                              child: Text(
                                "START",
                                style: GoogleFonts.bungee(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 25,
                                ),
                              ),
                            ),
                          ),
                        )
                      ]));
              }
            },
          ),
        ));
  }
}

