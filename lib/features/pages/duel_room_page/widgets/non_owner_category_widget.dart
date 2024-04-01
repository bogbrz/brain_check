import 'package:brain_check/domain/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NonOwnerCategoryWidget extends StatelessWidget {
  const NonOwnerCategoryWidget(
      {super.key, required this.playerOne, required this.playerTwo});

  final List<PlayerModel> playerOne;
  final List<PlayerModel> playerTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width * 0.01))),
      width: MediaQuery.of(context).size.width * 0.98,
      height: MediaQuery.of(context).size.height * 0.075,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Center(
          child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Text(
                playerOne.isNotEmpty
                    ? playerOne[0].category
                    : playerTwo.isNotEmpty
                        ? playerTwo[0].category
                        : AppLocalizations.of(context).notChoosen,
                style: GoogleFonts.bungee(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 50),
              )),
        ),
      ),
    );
  }
}
