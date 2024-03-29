
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/game_room_model.dart';

import 'package:brain_check/features/pages/duel_room_page/duel_room_page.dart';
import 'package:brain_check/features/pages/rooms_list_page/cubit/rooms_list_page_cubit.dart';
import 'package:brain_check/features/pages/rooms_list_page/widgets/create_room_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';











class JoinRoomWidget extends StatelessWidget {



  JoinRoomWidget({
    required this.nickName,
    required this.model,
    required this.email,
    required this.id,
    required this.user,
    required this.room,
    super.key,
  });
  final String nickName;
  final GameRoomModel model;
  final String email;
  final String id;
  final User? user;
  final GameRoomModel room;

  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        "${room.nickName}'s room",
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
                "Enter password",
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
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Room is full",
                          style: GoogleFonts.bungee(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height / 50),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GameRoomPage(
                              nickName: nickName,
                              user: user,
                              roomModel: room,
                            )));
                    passwordController.clear();
                  }
                } else {
                  passwordController.clear();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Wrong password",
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
                "Join",
                style: GoogleFonts.bungee(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 50),
              ))
        ],
      )),
    );
  }
}