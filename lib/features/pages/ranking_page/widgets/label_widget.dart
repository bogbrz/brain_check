import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6, top: 6),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(180, 66, 120, 255),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              child: Center(
                  child: Text(
                AppLocalizations.of(context).place,
                style: GoogleFonts.bungee(
                    fontSize: MediaQuery.of(context).size.height / 50),
              ))),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Center(
                  child: Text(
                "PLAYER ",
                style: GoogleFonts.bungee(
                    fontSize: MediaQuery.of(context).size.height / 50),
              ))),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.20,
              child: Center(
                child: Text(
                  AppLocalizations.of(context).gamesPlayed,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bungee(
                      fontSize: MediaQuery.of(context).size.height / 50),
                ),
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Center(
                child: Text(
              AppLocalizations.of(context).points,
              style: GoogleFonts.bungee(
                  fontSize: MediaQuery.of(context).size.height / 50),
            )),
          )
        ],
      ),
    );
  }
}
