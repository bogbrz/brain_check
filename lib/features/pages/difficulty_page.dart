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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: screenHeight / 5,
              child: Wrap(
                children: [
                  Text("Choosed category: ${widget.categoriesModel.name}",
                      style: Theme.of(context).textTheme.displaySmall),
                ],
              ),
            ),
            Text("Choose difficulty:",
                style: Theme.of(context).textTheme.displaySmall),
            Row(
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => QuestionPage(
                                category: widget.categoriesModel.id,
                                difficulty: choosedDifficulty,
                              ))));

                      print("$choosedDifficulty");
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 4,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Random",
                              style: Theme.of(context).textTheme.bodySmall),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => QuestionPage(
                                category: widget.categoriesModel.id,
                                difficulty: choosedDifficulty,
                              ))));
                      print("$choosedDifficulty");
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 4,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 50, 115, 52),
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Easy",
                              style: Theme.of(context).textTheme.bodySmall),
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
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        choosedDifficulty = "medium";
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => QuestionPage(
                                category: widget.categoriesModel.id,
                                difficulty: choosedDifficulty,
                              ))));

                      print("$choosedDifficulty");
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 4,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Medium",
                              style: Theme.of(context).textTheme.bodySmall),
                          Image(
                            image: AssetImage("images/bitten_leaf_scaled.png"),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => QuestionPage(
                                category: widget.categoriesModel.id,
                                difficulty: choosedDifficulty,
                              ))));
                      print("$choosedDifficulty");
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 4,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Hard",
                              style: Theme.of(context).textTheme.bodySmall),
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
            Text("Choose number of quesitons:",
                style: Theme.of(context).textTheme.displaySmall),
            Row(
              children: [
                Material(
                  shape: OutlineInputBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      print("$choosedDifficulty");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 4,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(width: 4, color: Colors.black)),
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
                      print("$choosedDifficulty");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(width: 4, color: Colors.black)),
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
                      print("$choosedDifficulty");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 4,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(width: 4, color: Colors.black)),
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
                      print("$choosedDifficulty");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 4,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(width: 4, color: Colors.black)),
                      child: Text("Survival",
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ),
                ),
              ],
            ),
            Material(
              shape: OutlineInputBorder(),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  print("$choosedDifficulty");
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 4,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(width: 4, color: Colors.black)),
                  child: Text("START",
                      style: Theme.of(context).textTheme.bodySmall),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
