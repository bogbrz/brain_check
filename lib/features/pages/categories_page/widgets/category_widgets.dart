import 'package:brain_check/domain/models/categories_model.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RandomCategoryWidget extends StatelessWidget {
  const RandomCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 2.2,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 138, 154, 214),
            Color.fromARGB(180, 66, 120, 255),
          ],
        ),
      ),
      child: Text(
        AppLocalizations.of(context).random,
        style: GoogleFonts.bungee(
          fontSize: MediaQuery.of(context).size.height / 65,
        ),
        selectionColor: Colors.white,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final TriviaCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 2.2,
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
           Color.fromARGB(255, 138, 154, 214),
            Color.fromARGB(180, 66, 120, 255),
          ],
        ),
      ),
      child: Text(
        category.name,
        style: GoogleFonts.bungee(
            fontSize: MediaQuery.of(context).size.height / 65),
        selectionColor: Colors.white,
        textAlign: TextAlign.center,
      ),
    );
  }
}
