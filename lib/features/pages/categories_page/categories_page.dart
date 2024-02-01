import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/features/pages/categories_page/cubit/categories_page_cubit.dart';
import 'package:brain_check/features/pages/difficulty_page/difficulty_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    required this.user,
    super.key,
  });
  final User? user;
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
            "Choose category",
            style: GoogleFonts.bungee(fontSize: 30, color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 27, 58, 93),
        ),
        body: ListView(children: [
          Center(child: BlocBuilder<CategoriesPageCubit, CategoriesPageState>(
            builder: (context, state) {
              if (state.categories.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return Wrap(children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Material(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          choosedCategory = 0;
                        });

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => DifficultyPage(
                                  user: widget.user,
                                  categoriesModel:
                                      TriviaCategory(id: 0, name: "Random"),
                                ))));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 2.2,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 56, 146, 249),
                          border: Border.all(width: 8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Random",
                          style: GoogleFonts.bungee(fontSize: 15),
                          selectionColor: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                for (final category in state.categories) ...[
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Material(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            choosedCategory = category.id;
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => DifficultyPage(
                                    user: widget.user,
                                    categoriesModel: category,
                                  ))));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width / 2.2,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 56, 146, 249),
                            border: Border.all(width: 8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            category.name,
                            style: GoogleFonts.bungee(fontSize: 15),
                            selectionColor: Colors.white,
                            textAlign: TextAlign.center,
                          ),
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
