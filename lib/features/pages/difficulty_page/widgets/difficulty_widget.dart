import 'package:brain_check/domain/models/difficulty_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';



class DifficultyWidget extends StatelessWidget {
  const DifficultyWidget({
    super.key,
    required this.difficulty,
    required this.choosedDifficulty,
  });

  final DifficultyModel difficulty;
  final String choosedDifficulty;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: choosedDifficulty == ""
          ? MediaQuery.of(context).size.height * 0.1
          : choosedDifficulty == difficulty.nameId
              ? MediaQuery.of(context).size.height * 0.15
              : MediaQuery.of(context).size.height * 0.1,
      width: choosedDifficulty == ""
          ? MediaQuery.of(context).size.width * 0.24
          : choosedDifficulty == difficulty.nameId
              ? MediaQuery.of(context).size.width * 0.35
              : MediaQuery.of(context).size.width * 0.21,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.5, 2],
          colors: [
            difficulty.color,
            const Color.fromARGB(255, 255, 255, 255),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            difficulty.name == "Easy"
                ? AppLocalizations.of(context).easy
                : difficulty.name == "Medium"
                    ? AppLocalizations.of(context).medium
                    : difficulty.name == "Random"
                        ? AppLocalizations.of(context).random
                        : AppLocalizations.of(context).hard,
            style: GoogleFonts.bungee(
              fontSize: choosedDifficulty == ''
                  ? MediaQuery.of(context).size.width / 25
                  : choosedDifficulty == difficulty.nameId
                      ? MediaQuery.of(context).size.width / 15
                      : MediaQuery.of(context).size.width / 35,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: difficulty.icon,
            ),
          ),
        ],
      ),
    );
  }
}
