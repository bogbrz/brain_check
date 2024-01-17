import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/categories_page/cubit/categories_page_cubit.dart';
import 'package:brain_check/features/pages/difficulty_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var choosedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesPageCubit>()..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "BRAIN CHECK APP",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 27, 58, 93),
        ),
        body: ListView(children: [
          Center(child: BlocBuilder<CategoriesPageCubit, CategoriesPageState>(
            builder: (context, state) {
              if (state.categories.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return Wrap(children: [
                Text("Choose category:",
                    style: Theme.of(context).textTheme.displayMedium),
                for (final category in state.categories) ...[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          choosedCategory = category.id;
                        });
                        print("${category.name} , ${category.id}");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => DifficultyPage(
                                  categoriesModel: category,
                                ))));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 2.5,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 56, 146, 249),
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          category.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                          selectionColor: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ]);
            },
          ))
        ]),
      ),
    );
  }
}
