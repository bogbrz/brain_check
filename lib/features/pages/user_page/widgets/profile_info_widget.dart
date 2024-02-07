
import 'package:brain_check/domain/models/profile_model.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';




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
            Text("Your nickname: ${profile.nickName}",
                textAlign: TextAlign.left,
                style: GoogleFonts.bungee(
                    fontSize: MediaQuery.of(context).size.height / 35)),
            Text(
              "Your email adress: ${user!.email}",
              style: GoogleFonts.bungee(
                  fontSize: MediaQuery.of(context).size.height / 35),
              textAlign: TextAlign.left,
            ),
            Text(
              "Quiz played: ${profile.gamesPlayed} ",
              style: GoogleFonts.bungee(
                  fontSize: MediaQuery.of(context).size.height / 35),
              textAlign: TextAlign.left,
            ),
            Text(
              "Personal rating: ${profile.points}",
              style: GoogleFonts.bungee(
                  fontSize: MediaQuery.of(context).size.height / 35),
              textAlign: TextAlign.left,
            ),
          ],
        ],
      ),
    );
  }
}
