
import 'package:brain_check/domain/models/categories_model.dart';


import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';





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
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 56, 146, 249),
        border: Border.all(
            width: MediaQuery.of(context).size.width / 45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "Random",
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
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 56, 146, 249),
        border: Border.all(
            width: MediaQuery.of(context).size.width / 45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        category.name,
        style: GoogleFonts.bungee(
            fontSize:
                MediaQuery.of(context).size.height / 65),
        selectionColor: Colors.white,
        textAlign: TextAlign.center,
      ),
    );
  }
}
