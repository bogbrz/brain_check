import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6, top: 6),
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal:
                  BorderSide(width: MediaQuery.of(context).size.width / 55)),
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
                "Place",
                style: GoogleFonts.bungee(
                    fontSize: MediaQuery.of(context).size.height / 50),
              ))),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Center(
                  child: Text(
                "Nickname",
                style: GoogleFonts.bungee(
                    fontSize: MediaQuery.of(context).size.height / 50),
              ))),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Center(
                child: Text(
                  "Games played",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bungee(
                      fontSize: MediaQuery.of(context).size.height / 50),
                ),
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Center(
                child: Text(
              "Points",
              style: GoogleFonts.bungee(
                  fontSize: MediaQuery.of(context).size.height / 50),
            )),
          )
        ],
      ),
    );
  }
}
