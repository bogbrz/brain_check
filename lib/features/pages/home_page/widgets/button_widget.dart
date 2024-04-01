import 'package:brain_check/features/pages/game_type_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartButtonWidget extends StatelessWidget {
  const StartButtonWidget({
    super.key,
    required this.user,
    required this.nickName,
  });

  final User? user;

  final String nickName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        shadowColor: Colors.white70,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GameTypePage(
                      nickName: nickName,
                      user: user,
                    )));
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: MediaQuery.of(context).size.width / 40),
            ),
            child: Text(AppLocalizations.of(context).play,
                style: GoogleFonts.bungee(fontSize: 45)),
          ),
        ),
      ),
    );
  }
}
