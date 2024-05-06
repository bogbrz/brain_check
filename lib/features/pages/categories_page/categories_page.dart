import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/models/difficulty_page_route_model.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/features/pages/categories_page/cubit/categories_page_cubit.dart';
import 'package:brain_check/features/pages/categories_page/widgets/category_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    required this.user,
    required this.profileModel,
    super.key,
  });
  final User? user;
  final ProfileModel profileModel;

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
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     AppLocalizations.of(context).chooseCategory,
        //     style: GoogleFonts.bungee(
        //         fontSize: MediaQuery.of(context).size.height / 30,
        //         color: Colors.white),
        //   ),
        //   backgroundColor: const Color.fromARGB(255, 27, 58, 93),
        // ),
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
                return Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 0, 27, 48),
                      Color.fromARGB(180, 66, 120, 255),
                    ],
                  )),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.04),
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
                            ),
                            Text(
                              "Choose your category",
                              style: GoogleFonts.bungee(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 40),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(children: [
                          Center(
                              child: Wrap(children: [
                            Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.01),
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

                                    context.pushNamed(
                                      "/difficultyPage",
                                      extra: DifficultyRouteModel(
                                          user: widget.user!,
                                          profileModel: widget.profileModel,
                                          category: TriviaCategory(
                                              id: 0, name: "Random")),
                                    );

                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: ((context) =>
                                    //             DifficultyPage(
                                    //               profileModel:
                                    //                   widget.profileModel,
                                    //               user: widget.user,
                                    //               categoriesModel:
                                    //                   TriviaCategory(
                                    //                       id: 0,
                                    //                       name: "Random"),
                                    //             ))));
                                  },
                                  child: const RandomCategoryWidget(),
                                ),
                              ),
                            ),
                            for (final category in state.categories) ...[
                              Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.01),
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
                                      context.pushNamed(
                                        "/difficultyPage",
                                        extra: DifficultyRouteModel(
                                            user: widget.user!,
                                            profileModel: widget.profileModel,
                                            category: category),
                                      );
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: ((context) =>
                                      //             DifficultyPage(
                                      //               profileModel:
                                      //                   widget.profileModel,
                                      //               user: widget.user,
                                      //               categoriesModel: category,
                                      //             ))));
                                    },
                                    child: CategoryWidget(category: category),
                                  ),
                                ),
                              )
                            ],
                          ]))
                        ]),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
