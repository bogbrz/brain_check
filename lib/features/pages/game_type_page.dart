
import 'package:brain_check/features/pages/categories_page/categories_page.dart';
import 'package:brain_check/features/pages/duel_page/duel_page.dart';
import 'package:brain_check/features/pages/ranked_game_page/ranked_game_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameTypePage extends StatelessWidget {
  const GameTypePage({super.key, required this.user, required this.nickName});
  final User? user;
  final String nickName;

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
                            builder: (context) => CategoryPage(user: user)));
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
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Text("CASUAL",
                                style: GoogleFonts.bungee(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 20,
                                ))),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => RankedGamePage(
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
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Text("RANKED",
                              style: GoogleFonts.bungee(
                                fontSize:
                                    MediaQuery.of(context).size.height / 20,
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
                    builder: (context) => DuelPage(
                      user: user,
                      nickName: nickName,
                    
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
                  child: SizedBox(
                    child: Text('''D U E L''',
                        style: GoogleFonts.bungee(
                          fontSize: MediaQuery.of(context).size.height / 20,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
