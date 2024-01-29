import 'package:brain_check/app/global%20cubit/cubit/user_page_cubit.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/categories_page/categories_page.dart';
import 'package:brain_check/features/pages/home_page/cubit/home_page_cubit.dart';
import 'package:brain_check/features/pages/ranking_page/ranking_page.dart';

import 'package:brain_check/features/pages/settings_page/settings_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.user,
  });
  final User? user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomePageCubit>()..getProfile(),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "BRAIN CHECK APP",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => SettingsPage(
                            user: user,
                          ))));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              )
            ],
            backgroundColor: Color.fromARGB(255, 27, 58, 93),
          ),
          body: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final profile in state.profile) ...[
                    Text("Welcome back ${profile.nickName}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayLarge),
                  ],
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Material(
                      shadowColor: Colors.white70,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CategoryPage(
                                    user: user,
                                  )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(width: 4, color: Colors.black)),
                          child: Text("PLAY",
                              style: Theme.of(context).textTheme.displayMedium),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 4, color: Colors.black)),
                            child: Text("HOW TO PLAY",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ),
                      ),
                      Material(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RankingPage()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 4, color: Colors.black)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("RANKING",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                Image(
                                  image: AssetImage(
                                    "images/trophy.png",
                                  ),
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          )),
    );
  }
}
