import 'package:brain_check/domain/models/profile_model.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class RankingProfileWidget extends StatelessWidget {
  const RankingProfileWidget({
    super.key,
    required this.i,
    required this.bungee,
    required this.profile,
  });

  final int i;
  final TextStyle bungee;
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: i == 1 || i == 2 || i == 3
          ? MediaQuery.of(context).size.height * 0.075
          : MediaQuery.of(context).size.height * 0.05,
      margin: const EdgeInsets.only(left: 2.5, right: 2.5, bottom: 6, top: 6),
      decoration: BoxDecoration(
          border: Border.all(
            width: MediaQuery.of(context).size.width / 55,
          ),
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
                      ? Image(
                          image: const AssetImage(
                            "images/first_place.png",
                          ),
                          width: MediaQuery.of(context).size.width / 5,
                        )
                      : i == 2
                          ? Image(
                              image: const AssetImage(
                                "images/second-prize.png",
                              ),
                              width: MediaQuery.of(context).size.width / 5,
                            )
                          : i == 3
                              ? Image(
                                  image: const AssetImage(
                                    "images/third-prize.png",
                                  ),
                                  width: MediaQuery.of(context).size.width / 5,
                                )
                              : Text(
                                  i.toString(),
                                  style: bungee,
                                ))),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.37,
              child: Center(
                  child: i == 1 || i == 2 || i == 3
                      ? Text(
                          profile.nickName,
                          style: GoogleFonts.bungee(
                              fontSize:
                                  MediaQuery.of(context).size.height / 55),
                        )
                      : Text(
                          profile.nickName,
                          style: GoogleFonts.bungee(
                              fontSize:
                                  MediaQuery.of(context).size.height / 65),
                        ))),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: i == 1 || i == 2 || i == 3
                  ? Text(
                      profile.gamesPlayed.toString(),
                      style: GoogleFonts.bungee(
                          fontSize: MediaQuery.of(context).size.height / 40),
                    )
                  : Text(
                      profile.gamesPlayed.toString(),
                      style: GoogleFonts.bungee(
                          fontSize: MediaQuery.of(context).size.height / 55),
                    )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.11,
            child: Center(
                child: i == 1 || i == 2 || i == 3
                    ? Text(
                        profile.points.toString(),
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 40),
                      )
                    : Text(
                        profile.points.toString(),
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 55),
                      )),
          )
        ],
      ),
    );
  }
}
