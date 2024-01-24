import 'package:brain_check/device_size.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/features/pages/question_page/question_page.dart';

import 'package:flutter/material.dart';

class DifficultyPage extends StatefulWidget {
  const DifficultyPage({
    required this.categoriesModel,
    super.key,
  });

  final TriviaCategory categoriesModel;

  @override
  State<DifficultyPage> createState() => _DifficultyPageState();
}

class _DifficultyPageState extends State<DifficultyPage> {
  var choosedDifficulty = '';
  var questionsNumber = null;

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.deviceWidth;
    double screenHeight = context.deviceHeight;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BRAIN CHECK APP",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 27, 58, 93),
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
                      border: Border.all(),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
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
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
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
                      shape: OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choosedDifficulty = null.toString();
                          });
                          print(
                              "${widget.categoriesModel.id}, $choosedDifficulty)}");

                          print("$choosedDifficulty");
                        },
                        child: Container(
                          height: choosedDifficulty == null.toString()
                              ? MediaQuery.of(context).size.height / 8
                              : MediaQuery.of(context).size.height / 10,
                          width: choosedDifficulty == null.toString()
                              ? MediaQuery.of(context).size.width / 3.5
                              : MediaQuery.of(context).size.width / 4.2,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.blueGrey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Random",
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                              Image(
                                image: AssetImage("images/question_mark.png"),
                                width: MediaQuery.of(context).size.width / 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      shape: OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choosedDifficulty = "easy";
                          });

                          print("$choosedDifficulty");
                        },
                        child: Container(
                          height: choosedDifficulty == "easy"
                              ? MediaQuery.of(context).size.height / 8
                              : MediaQuery.of(context).size.height / 10,
                          width: choosedDifficulty == "easy"
                              ? MediaQuery.of(context).size.width / 3.5
                              : MediaQuery.of(context).size.width / 4.2,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: const Color.fromARGB(255, 50, 115, 52),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Easy",
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                              Image(
                                image: AssetImage("images/leave.png"),
                                width: MediaQuery.of(context).size.width / 21,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      shape: OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choosedDifficulty = "medium";
                          });

                          print("$choosedDifficulty");
                        },
                        child: Container(
                          height: choosedDifficulty == "medium"
                              ? MediaQuery.of(context).size.height / 8
                              : MediaQuery.of(context).size.height / 10,
                          width: choosedDifficulty == "medium"
                              ? MediaQuery.of(context).size.width / 3.5
                              : MediaQuery.of(context).size.width / 4.2,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.yellow,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Medium",
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                              Image(
                                image:
                                    AssetImage("images/bitten_leaf_scaled.png"),
                                width: MediaQuery.of(context).size.width / 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      shape: OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choosedDifficulty = "hard";
                          });

                          print("$choosedDifficulty");
                        },
                        child: Container(
                          height: choosedDifficulty == "hard"
                              ? MediaQuery.of(context).size.height / 8
                              : MediaQuery.of(context).size.height / 10,
                          width: choosedDifficulty == "hard"
                              ? MediaQuery.of(context).size.width / 3.5
                              : MediaQuery.of(context).size.width / 4.2,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.red,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Hard",
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                              Image(
                                image: AssetImage("images/fire_leaf_scale.png"),
                                width: MediaQuery.of(context).size.width / 20,
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
                      shape: OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            questionsNumber = 1;
                          });
                          print("$choosedDifficulty");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: questionsNumber == 1
                              ? MediaQuery.of(context).size.height / 8
                              : MediaQuery.of(context).size.height / 10,
                          width: questionsNumber == 1
                              ? MediaQuery.of(context).size.width / 3.5
                              : MediaQuery.of(context).size.width / 4.2,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: questionsNumber == 1
                                ? Colors.orangeAccent
                                : Colors.blue,
                          ),
                          child: Text("1",
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                      ),
                    ),
                    Material(
                      shape: OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            questionsNumber = 5;
                          });
                          print("$choosedDifficulty");
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
                            color: questionsNumber == 5
                                ? Colors.orangeAccent
                                : Colors.blue,
                          ),
                          child: Text("5",
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                      ),
                    ),
                    Material(
                      shape: OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            questionsNumber = 10;
                          });
                          print("$choosedDifficulty");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: questionsNumber == 10
                              ? MediaQuery.of(context).size.height / 8
                              : MediaQuery.of(context).size.height / 10,
                          width: questionsNumber == 10
                              ? MediaQuery.of(context).size.width / 3.5
                              : MediaQuery.of(context).size.width / 4.2,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: questionsNumber == 10
                                ? Colors.orangeAccent
                                : Colors.blue,
                          ),
                          child: Text("10",
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                      ),
                    ),
                    Material(
                      shape: OutlineInputBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            questionsNumber = 0;
                          });
                          print("$choosedDifficulty");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: questionsNumber == 0
                              ? MediaQuery.of(context).size.height / 8
                              : MediaQuery.of(context).size.height / 10,
                          width: questionsNumber == 0
                              ? MediaQuery.of(context).size.width / 3.5
                              : MediaQuery.of(context).size.width / 4.2,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: questionsNumber == 0
                                ? Colors.orangeAccent
                                : Colors.blue,
                          ),
                          child: Text("Survival",
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
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
                              category: widget.categoriesModel.id,
                              difficulty: choosedDifficulty,
                              questionsNumber: questionsNumber,
                            ))));
                    print("$choosedDifficulty");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 2, color: Colors.black)),
                    child: Text("START",
                        style: Theme.of(context).textTheme.headlineLarge),
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
