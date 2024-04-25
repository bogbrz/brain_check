import 'package:brain_check/domain/models/duel_room_page_route_model.dart';
import 'package:brain_check/domain/models/game_room_model.dart';
import 'package:brain_check/domain/models/profile_model.dart';

import 'package:brain_check/features/pages/duel_room_page/duel_room_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JoinRoomWidget extends StatelessWidget {
  JoinRoomWidget({
    required this.nickName,
    required this.model,
    required this.email,
    required this.id,
    required this.user,
    required this.room,
    required this.profileModel,
    super.key,
  });
  final String nickName;
  final GameRoomModel model;
  final String email;
  final String id;
  final User? user;
  final ProfileModel profileModel;
  final GameRoomModel room;

  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        "${room.nickName} ${AppLocalizations.of(context).playerRoom}",
        style: GoogleFonts.bungee(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height / 35),
      ),
      content: Form(
          child: Column(
        children: [
          Row(
            children: [
              Text(
                "${AppLocalizations.of(context).enterPassword}",
                style: GoogleFonts.bungee(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 55),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                width: MediaQuery.of(context).size.width / 85,
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                width: MediaQuery.of(context).size.width / 85,
              )),
            ),
            controller: passwordController,
          ),
          ElevatedButton(
              onPressed: () {
                if (passwordController.text == model.password) {
                  if (room.playersAmount == 2) {
                    passwordController.clear();
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocalizations.of(context).roomIsFull,
                          style: GoogleFonts.bungee(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height / 50),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    context.pushNamed("/duelRoomPage",
                        extra: DuelRoomRoutePageModel(
                          userPicture: profileModel.imageUrl,
                          nickName: nickName,
                          user: user,
                          roomModel: room,
                        ));
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => GameRoomPage(
                    //           userPicture: profileModel.imageUrl,
                    //           nickName: nickName,
                    //           user: user,
                    //           roomModel: room,
                    //         )));
                    passwordController.clear();
                  }
                } else {
                  passwordController.clear();
               context.pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppLocalizations.of(context).wrongPassword,
                        style: GoogleFonts.bungee(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 50),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text(
                AppLocalizations.of(context).joinPlayer,
                style: GoogleFonts.bungee(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 50),
              ))
        ],
      )),
    );
  }
}
