import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context).addProfilePictrue,
          style: GoogleFonts.bungee(fontSize: 20),
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: MediaQuery.of(context).size.width * 0.22,
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 56, 113, 178),
            radius: MediaQuery.of(context).size.width * 0.2,
            child: const Icon(
              Icons.add_outlined,
              size: 60,
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context).setNickName,
          style: GoogleFonts.bungee(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            maxLength: 13,
            style: GoogleFonts.bungee(fontSize: 20),
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context).nickName,
                hintStyle: GoogleFonts.bungee(),
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide(width: 8)),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide(width: 8))),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
