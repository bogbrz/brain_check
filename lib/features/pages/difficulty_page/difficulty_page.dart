import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/features/pages/question_page/question_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BRAIN CHECK APP",
          style: GoogleFonts.bungee(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 27, 58, 93),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 8),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.38,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Choosed category: ${widget.categoriesModel.name}.",
                                style: GoogleFonts.bungee(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                choosedDifficulty.isEmpty
                                    ? "Choose difficulty: not choosen."
                                    : choosedDifficulty == null.toString()
                                        ? "Choose difficulty: random."
                                        : "Choose difficulty: $choosedDifficulty.",
                                style: GoogleFonts.bungee(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              questionsNumber == null
                                  ? "Amount: not choosen."
                                  : questionsNumber == 0
                                      ? "Amount: Survival."
                                      : "Amount: $questionsNumber.",
                              style: GoogleFonts.bungee(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      shape: const OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choosedDifficulty = null.toString();
                          });
                        },
                        child: Container(
                          height: choosedDifficulty == null.toString()
                              ? MediaQuery.of(context).size.height / 8
                              : MediaQuery.of(context).size.height / 10,
                          width: choosedDifficulty == null.toString()
                              ? MediaQuery.of(context).size.width / 3.5
                              : MediaQuery.of(context).size.width / 4.2,
                          decoration: BoxDecoration(
                            border: choosedDifficulty == "null"
                                ? Border.all(width: 2)
                                : Border.all(width: 6),
                            color: Colors.blueGrey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              choosedDifficulty == "null"
                                  ? Text(
                                      "Random",
                                      style: GoogleFonts.bungee(
                                        fontSize: 24,
                                      ),
                                    )
                                  : Text(
                                      "Random",
                                      style: GoogleFonts.bungee(
                                        fontSize: 12,
                                      ),
                                    ),
                              choosedDifficulty == "null"
                                  ? Image(
                                      image: const AssetImage(
                                          "images/question_mark.png"),
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                    )
                                  : Image(
                                      image: const AssetImage(
                                          "images/question_mark.png"),
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      shape: const OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choosedDifficulty = "easy";
                          });
                        },
                        child: Container(
                          height: choosedDifficulty == "easy"
                              ? MediaQuery.of(context).size.height / 8
                              : MediaQuery.of(context).size.height / 10,
                          width: choosedDifficulty == "easy"
                              ? MediaQuery.of(context).size.width / 3.5
                              : MediaQuery.of(context).size.width / 4.2,
                          decoration: BoxDecoration(
                            border: choosedDifficulty == "easy"
                                ? Border.all(width: 2)
                                : Border.all(width: 6),
                            color: const Color.fromARGB(255, 50, 115, 52),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              choosedDifficulty == "easy"
                                  ? Text(
                                      "Easy",
                                      style: GoogleFonts.bungee(
                                        fontSize: 25,
                                      ),
                                    )
                                  : Text(
                                      "Easy",
                                      style: GoogleFonts.bungee(
                                        fontSize: 12,
                                      ),
                                    ),
                              choosedDifficulty == "easy"
                                  ? Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Image(
                                        image: const AssetImage(
                                            "images/leave.png"),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                      ),
                                    )
                                  : Image(
                                      image:
                                          const AssetImage("images/leave.png"),
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      shape: const OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choosedDifficulty = "medium";
                          });
                        },
                        child: Container(
                          height: choosedDifficulty == "medium"
                              ? MediaQuery.of(context).size.height / 8
                              : MediaQuery.of(context).size.height / 10,
                          width: choosedDifficulty == "medium"
                              ? MediaQuery.of(context).size.width / 3.5
                              : MediaQuery.of(context).size.width / 4.2,
                          decoration: BoxDecoration(
                            border: choosedDifficulty == "medium"
                                ? Border.all(width: 2)
                                : Border.all(width: 6),
                            color: Colors.yellow,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              choosedDifficulty == "medium"
                                  ? Text(
                                      "Medium",
                                      style: GoogleFonts.bungee(
                                        fontSize: 25,
                                      ),
                                    )
                                  : Text(
                                      "Medium",
                                      style: GoogleFonts.bungee(
                                        fontSize: 12,
                                      ),
                                    ),
                              choosedDifficulty == "medium"
                                  ? Image(
                                      image: const AssetImage(
                                          "images/bitten_leaf_scaled.png"),
                                      width: MediaQuery.of(context).size.width /
                                          5.1,
                                    )
                                  : Image(
                                      image: const AssetImage(
                                          "images/bitten_leaf_scaled.png"),
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      shape: const OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choosedDifficulty = "hard";
                          });
                        },
                        child: Container(
                          height: choosedDifficulty == "hard"
                              ? MediaQuery.of(context).size.height / 8
                              : MediaQuery.of(context).size.height / 10,
                          width: choosedDifficulty == "hard"
                              ? MediaQuery.of(context).size.width / 3.5
                              : MediaQuery.of(context).size.width / 4.2,
                          decoration: BoxDecoration(
                            border: choosedDifficulty == "hard"
                                ? Border.all(width: 2)
                                : Border.all(width: 6),
                            color: Colors.red,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              choosedDifficulty == "hard"
                                  ? Text(
                                      "Hard",
                                      style: GoogleFonts.bungee(
                                        fontSize: 25,
                                      ),
                                    )
                                  : Text(
                                      "Hard",
                                      style: GoogleFonts.bungee(
                                        fontSize: 12,
                                      ),
                                    ),
                              choosedDifficulty == "hard"
                                  ? Image(
                                      image: const AssetImage(
                                          "images/fire_leaf_scale.png"),
                                      width: MediaQuery.of(context).size.width /
                                          5.1,
                                    )
                                  : Image(
                                      image: const AssetImage(
                                          "images/fire_leaf_scale.png"),
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      shape: const OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            questionsNumber = 1;
                          });
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: questionsNumber == 1
                                ? MediaQuery.of(context).size.height / 8
                                : MediaQuery.of(context).size.height / 10,
                            width: questionsNumber == 1
                                ? MediaQuery.of(context).size.width / 3.5
                                : MediaQuery.of(context).size.width / 4.2,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: questionsNumber == 1
                                  ? Border.all(width: 2)
                                  : Border.all(width: 6),
                              color: questionsNumber == 1
                                  ? Colors.orangeAccent
                                  : Colors.blue,
                            ),
                            child: questionsNumber == 1
                                ? Text(
                                    "1",
                                    style: GoogleFonts.bungee(
                                      fontSize: 30,
                                    ),
                                  )
                                : Text(
                                    "1",
                                    style: GoogleFonts.bungee(
                                      fontSize: 20,
                                    ),
                                  )),
                      ),
                    ),
                    Material(
                      shape: const OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            questionsNumber = 5;
                          });
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: questionsNumber == 5
                                ? MediaQuery.of(context).size.height / 8
                                : MediaQuery.of(context).size.height / 10,
                            width: questionsNumber == 5
                                ? MediaQuery.of(context).size.width / 3.5
                                : MediaQuery.of(context).size.width / 4.2,
                            decoration: BoxDecoration(
                              border: questionsNumber == 5
                                  ? Border.all(width: 2)
                                  : Border.all(width: 6),
                              color: questionsNumber == 5
                                  ? Colors.orangeAccent
                                  : Colors.blue,
                            ),
                            child: questionsNumber == 5
                                ? Text(
                                    "5",
                                    style: GoogleFonts.bungee(
                                      fontSize: 30,
                                    ),
                                  )
                                : Text(
                                    "5",
                                    style: GoogleFonts.bungee(
                                      fontSize: 20,
                                    ),
                                  )),
                      ),
                    ),
                    Material(
                      shape: const OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            questionsNumber = 10;
                          });
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: questionsNumber == 10
                                ? MediaQuery.of(context).size.height / 8
                                : MediaQuery.of(context).size.height / 10,
                            width: questionsNumber == 10
                                ? MediaQuery.of(context).size.width / 3.5
                                : MediaQuery.of(context).size.width / 4.2,
                            decoration: BoxDecoration(
                              border: questionsNumber == 10
                                  ? Border.all(width: 2)
                                  : Border.all(width: 6),
                              color: questionsNumber == 10
                                  ? Colors.orangeAccent
                                  : Colors.blue,
                            ),
                            child: questionsNumber == 10
                                ? Text(
                                    "10",
                                    style: GoogleFonts.bungee(
                                      fontSize: 30,
                                    ),
                                  )
                                : Text(
                                    "10",
                                    style: GoogleFonts.bungee(
                                      fontSize: 15,
                                    ),
                                  )),
                      ),
                    ),
                    Material(
                      shape: const OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            questionsNumber = 0;
                          });
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: questionsNumber == 0
                                ? MediaQuery.of(context).size.height / 8
                                : MediaQuery.of(context).size.height / 10,
                            width: questionsNumber == 0
                                ? MediaQuery.of(context).size.width / 3.5
                                : MediaQuery.of(context).size.width / 4.2,
                            decoration: BoxDecoration(
                              border: questionsNumber == 0
                                  ? Border.all(width: 2)
                                  : Border.all(width: 6),
                              color: questionsNumber == 0
                                  ? Colors.orangeAccent
                                  : Colors.blue,
                            ),
                            child: questionsNumber == 0
                                ? Text(
                                    "Survival",
                                    style: GoogleFonts.bungee(
                                      fontSize: 19,
                                    ),
                                  )
                                : Text(
                                    "Survival",
                                    style: GoogleFonts.bungee(
                                      fontSize: 14,
                                    ),
                                  )),
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => QuestionPage(
                              user: widget.user,
                              category: widget.categoriesModel.id,
                              difficulty: choosedDifficulty,
                              questionsNumber: questionsNumber,
                            ))));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 8, color: Colors.black)),
                    child: Text(
                      "START",
                      style: GoogleFonts.bungee(
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
