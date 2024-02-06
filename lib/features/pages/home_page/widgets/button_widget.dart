

import 'package:brain_check/features/pages/categories_page/categories_page.dart';


import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';



class StartButtonWidget extends StatelessWidget {
  const StartButtonWidget({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        shadowColor: Colors.white70,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryPage(
                      user: user,
                    )));
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: MediaQuery.of(context).size.width / 40),
            ),
            child: Text("PLAY", style: GoogleFonts.bungee(fontSize: 45)),
          ),
        ),
      ),
    );
  }
}
