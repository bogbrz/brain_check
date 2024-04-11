import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/features/pages/categories_page/categories_page.dart';

import 'package:brain_check/features/pages/ranked_game_page/ranked_game_page.dart';
import 'package:brain_check/features/pages/rooms_list_page/rooms_list_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GameTypePage extends StatelessWidget {
  const GameTypePage({super.key, required this.user, required this.profile});
  final User? user;
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 58, 93),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CategoryPage(user: user,profileModel: profile,)));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.49,
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: MediaQuery.of(context).size.width / 40),
                        ),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.07,
                            child: Text(AppLocalizations.of(context).casual,
                                style: GoogleFonts.bungee(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 31,
                                ))),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => RankedGamePage(
                            profileModel: profile,
                                user: user,
                              ))));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.49,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: MediaQuery.of(context).size.width / 40),
                      ),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.07,
                          child: Text(AppLocalizations.of(context).ranked,
                              style: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 31,
                              ))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RoomsListPage(
                      user: user,
                      profile: profile,
                    ),
                  ));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: MediaQuery.of(context).size.width / 40),
                  ),
                  child: Text(AppLocalizations.of(context).duel,
                      style: GoogleFonts.bungee(
                          fontSize: MediaQuery.of(context).size.height / 30,
                          letterSpacing:
                              MediaQuery.of(context).size.width * 0.05)),
                ),
              ),
            ],
          ),
        ));
  }
}
