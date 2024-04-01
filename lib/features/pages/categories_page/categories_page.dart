import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/features/pages/categories_page/cubit/categories_page_cubit.dart';
import 'package:brain_check/features/pages/categories_page/widgets/category_widgets.dart';
import 'package:brain_check/features/pages/difficulty_page/difficulty_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            AppLocalizations.of(context).chooseCategory,
            style: GoogleFonts.bungee(
                fontSize: MediaQuery.of(context).size.height / 30,
                color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 27, 58, 93),
        ),
        body: BlocBuilder<CategoriesPageCubit, CategoriesPageState>(
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
                return ListView(children: [
                  Center(
                      child: Wrap(children: [
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
                          child: const RandomCategoryWidget(),
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
                            child: CategoryWidget(category: category),
                          ),
                        ),
                      )
                    ],
                  ]))
                ]);
            }
          },
        ),
      ),
    );
  }
}
