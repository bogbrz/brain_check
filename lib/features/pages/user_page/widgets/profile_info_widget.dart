import 'package:brain_check/domain/models/profile_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({
    super.key,
    required this.user,
    required this.profiles,
  });

  final User? user;
  final List<ProfileModel> profiles;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 27, 58, 93),
            radius: 40,
          ),
          for (final profile in profiles) ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                      "${AppLocalizations.of(context).yourNickName}: ${profile.nickName}",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.bungee(
                          fontSize: MediaQuery.of(context).size.height / 35)),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${AppLocalizations.of(context).yourEmail}: ${user!.email}",
                    style: GoogleFonts.bungee(
                        fontSize: MediaQuery.of(context).size.height / 35),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${AppLocalizations.of(context).quizPlayerd}: ${profile.gamesPlayed} ",
                    style: GoogleFonts.bungee(
                        fontSize: MediaQuery.of(context).size.height / 35),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${AppLocalizations.of(context).personalRating}: ${profile.points}",
                    style: GoogleFonts.bungee(
                        fontSize: MediaQuery.of(context).size.height / 35),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
