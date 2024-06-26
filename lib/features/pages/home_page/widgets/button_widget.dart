import 'package:brain_check/domain/models/profile_model.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartButtonWidget extends StatelessWidget {
  const StartButtonWidget({
    super.key,
    required this.user,
    required this.profile,
  });

  final User? user;

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.white70,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          context.push("/gameTypePage", extra: profile);
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(180, 66, 120, 255),
              ],
            ),
          ),
          child: Text(AppLocalizations.of(context).play,
              style: GoogleFonts.bungee(fontSize: 45)),
        ),
      ),
    );
  }
}
