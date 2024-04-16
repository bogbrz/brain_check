import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/features/pages/user_page/cubit/cubit/profile_picture_cubit.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({
    super.key,
    required this.user,
    required this.profiles,
    required this.profileImageUrl,
  });

  final User? user;
  final List<ProfileModel> profiles;
  final String? profileImageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 27, 58, 93),
            radius: MediaQuery.of(context).size.width * 0.2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.12,
              )),
              child: Image.network(
                profileImageUrl!,
                fit: BoxFit.scaleDown,
              ),
            ),
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
