import 'package:brain_check/domain/models/profile_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GameTypePage extends StatelessWidget {
  const GameTypePage({
    super.key,
    required this.user,
    required this.profile,
  });
  final User? user;
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 0, 27, 48),
          Color.fromARGB(180, 66, 120, 255),
        ],
      )),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_sharp),
                  color: Colors.white,
                  iconSize: MediaQuery.of(context).size.height * 0.05,
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      context.pushNamed("/categoryPage", extra: profile);
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => CategoryPage(
                      //           user: user,
                      //           profileModel: profile,
                      //         )));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 159, 177, 240),
                            Color.fromARGB(180, 66, 120, 255),
                          ],
                        ),
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
                Material(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      context.pushNamed("/rankedGamePage", extra: profile);
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: ((context) => RankedGamePage(
                      //           profileModel: profile,
                      //           user: user,
                      //         ))));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(255, 159, 177, 240),
                              Color.fromARGB(180, 66, 120, 255),
                            ],
                          )),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.07,
                          child: Text(AppLocalizations.of(context).ranked,
                              style: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 31,
                              ))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
            child: InkWell(
              onTap: () {
                context.pushNamed("/roomsListPage", extra: profile);
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => RoomsListPage(
                //     user: user,
                //     profile: profile,
                //   ),
                // ));
              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width * 0.320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 138, 154, 214),
                        Color.fromARGB(180, 66, 120, 255),
                      ],
                    )),
                child: Text(AppLocalizations.of(context).duel,
                    style: GoogleFonts.bungee(
                        fontSize: MediaQuery.of(context).size.height / 30,
                        letterSpacing:
                            MediaQuery.of(context).size.width * 0.05)),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
