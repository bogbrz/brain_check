import 'package:brain_check/domain/models/overall_info_model.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PageExtrasWidget extends StatelessWidget {
  const PageExtrasWidget(
      {super.key,
      required this.user,
      required this.overall,
      required this.profiles});

  final User? user;
  final Overall overall;
  final List<ProfileModel> profiles;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: const Image(
                image: AssetImage("images/brain_question_white.png"))),
        Center(
          child: Column(
            children: [
              Text(
                "${AppLocalizations.of(context).welcomeBack} ${profiles[0].nickName}",
                textAlign: TextAlign.center,
                style: GoogleFonts.bungee(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
