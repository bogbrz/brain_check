

import 'package:brain_check/domain/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';




class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.profile,
  });
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(180, 66, 120, 255),
              Colors.white,
            ],
          )),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.38,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    "Brain Check ${AppLocalizations.of(context).tokens}: ${profile.lifes}",
                    style: GoogleFonts.bungee(
                        fontSize: MediaQuery.of(context).size.height / 40,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                    child: const Image(
                      image: AssetImage("images/brain.png"),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "${AppLocalizations.of(context).gamesPlayed}: ${profile.gamesPlayed}",
                    style: GoogleFonts.bungee(
                        fontSize: MediaQuery.of(context).size.height / 40,
                        color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${AppLocalizations.of(context).yourScore}: ${profile.points}",
                    style: GoogleFonts.bungee(
                        fontSize: MediaQuery.of(context).size.height / 40,
                        color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Number of questions: 5",
                      style: GoogleFonts.bungee(
                          fontSize: MediaQuery.of(context).size.height / 40,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${AppLocalizations.of(context).category}: ${AppLocalizations.of(context).random}",
                      style: GoogleFonts.bungee(
                          fontSize: MediaQuery.of(context).size.height / 40,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${AppLocalizations.of(context).difficulty}: ${AppLocalizations.of(context).random}",
                      style: GoogleFonts.bungee(
                          fontSize: MediaQuery.of(context).size.height / 40,
                          color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
