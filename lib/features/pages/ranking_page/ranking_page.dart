import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/ranking_page/cubit/ranking_page_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RankingPage extends StatelessWidget {
  RankingPage({super.key});
  final TextStyle bungee = GoogleFonts.bungee();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RankingPageCubit>()..getRanking(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 58, 93),
          centerTitle: true,
          title: Text("RANKING",
              style: GoogleFonts.bungee(color: Colors.white, fontSize: 35)),
        ),
        body: BlocBuilder<RankingPageCubit, RankingPageState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 6, top: 6),
                  decoration: const BoxDecoration(
                      border:
                          Border.symmetric(horizontal: BorderSide(width: 4)),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: Center(child: Text("Place", style: bungee))),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child:
                              Center(child: Text("Nickname", style: bungee))),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Center(
                            child: Text("Games played",
                                textAlign: TextAlign.center, style: bungee),
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Center(child: Text("Points", style: bungee)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.profiles.length,
                    itemBuilder: (context, index) {
                      final profile = state.profiles[index];
                      int i = index + 1;
                      return Container(
                        height: i == 1 || i == 2 || i == 3
                            ? MediaQuery.of(context).size.height * 0.075
                            : MediaQuery.of(context).size.height * 0.05,
                        margin: const EdgeInsets.only(
                            left: 2.5, right: 2.5, bottom: 6, top: 6),
                        decoration: BoxDecoration(
                            border: Border.all(width: 4),
                            borderRadius: BorderRadius.circular(10),
                            color: i == 1
                                ? Colors.yellowAccent
                                : i == 2
                                    ? const Color.fromARGB(255, 199, 192, 192)
                                    : i == 3
                                        ? Colors.orangeAccent
                                        : Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: Center(
                                    child: i == 1
                                        ? const Image(
                                            image: AssetImage(
                                              "images/first_place.png",
                                            ),
                                            width: 40,
                                          )
                                        : i == 2
                                            ? const Image(
                                                image: AssetImage(
                                                  "images/second-prize.png",
                                                ),
                                                width: 40,
                                              )
                                            : i == 3
                                                ? const Image(
                                                    image: AssetImage(
                                                      "images/third-prize.png",
                                                    ),
                                                    width: 40,
                                                  )
                                                : Text(
                                                    i.toString(),
                                                    style: bungee,
                                                  ))),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.37,
                                child: Center(
                                    child: i == 1 || i == 2 || i == 3
                                        ? Text(profile.nickName, style: bungee)
                                        : Text(
                                            profile.nickName,
                                            style: bungee,
                                          ))),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: i == 1 || i == 2 || i == 3
                                    ? Text(
                                        profile.gamesPlayed.toString(),
                                        style: bungee,
                                      )
                                    : Text(
                                        profile.gamesPlayed.toString(),
                                        style: bungee,
                                      )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: Center(
                                  child: i == 1 || i == 2 || i == 3
                                      ? Text(profile.points.toString(),
                                          style: bungee)
                                      : Text(
                                          profile.points.toString(),
                                          style: bungee,
                                        )),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
