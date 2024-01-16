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
          children: [
            SizedBox(
              height: screenHeight / 4,
              child: Wrap(
                children: [
                  Text("Choosed category: ${widget.categoriesModel.name}",
                      style: Theme.of(context).textTheme.displayMedium),
                ],
              ),
            ),
            Text("Choose difficulty:",
                style: Theme.of(context).textTheme.displayMedium),
            SizedBox(
              height: 12,
            ),
            Material(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  setState(() {
                    choosedDifficulty = null.toString();
                  });
                  print("${widget.categoriesModel.id}, $choosedDifficulty)}");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => QuestionPage(
                            category: widget.categoriesModel.id,
                            difficulty: choosedDifficulty,
                          ))));

                  print("$choosedDifficulty");
                },
                child: Container(
                  width: screenWidth / 3,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 4, color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Random",
                          style: Theme.of(context).textTheme.displaySmall),
                      Image(
                        image: AssetImage("images/question_mark.png"),
                        width: MediaQuery.of(context).size.width / 8,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Material(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
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
                  width: screenWidth / 3,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 50, 115, 52),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 4, color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Easy",
                          style: Theme.of(context).textTheme.displaySmall),
                      Image(
                        image: AssetImage("images/leave.png"),
                        width: MediaQuery.of(context).size.width / 8,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Material(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
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
                  width: screenWidth / 3,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 4, color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Medium",
                          style: Theme.of(context).textTheme.displaySmall),
                      Image(
                        image: AssetImage("images/bitten_leaf_scaled.png"),
                        width: MediaQuery.of(context).size.width / 8,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Material(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
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
                  width: screenWidth / 3,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 4, color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hard",
                          style: Theme.of(context).textTheme.displaySmall),
                      Image(
                        image: AssetImage("images/fire_leaf_scale.png"),
                        width: MediaQuery.of(context).size.width / 8,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
