import 'package:brain_check/app/features/pages/difficulty_page.dart';
import 'package:brain_check/category_list.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var choosedCategory = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BRAIN CHECK APP",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 27, 58, 93),
      ),
      body: ListView(children: [
        Center(
          child: Wrap(children: [
            Text("Choose category:",
                style: Theme.of(context).textTheme.displayMedium),
            for (final category in categories) ...[
              Padding(
                padding: EdgeInsets.all(5),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      choosedCategory = category;
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => DifficultyPage(
                              category: choosedCategory,
                            ))));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 2.5,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 56, 146, 249),
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          category,
                          style: Theme.of(context).textTheme.bodyLarge,
                          selectionColor: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ]),
        )
      ]),
    );
  }
}
