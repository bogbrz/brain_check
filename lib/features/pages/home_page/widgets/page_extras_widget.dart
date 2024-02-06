
import 'package:brain_check/domain/models/overall_info_model.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




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
        Text(
            "TOTAL AMOUNT OF QUESTIONS: ${overall.totalNumOfVerifiedQuestions} "),
        for (final profile in profiles) ...[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Text(
                  '''Welcome back ${profile.nickName}''',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bungee(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height / 15),
                ),
              ),
            ),
          ),
        ],
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ],
    );
  }
}