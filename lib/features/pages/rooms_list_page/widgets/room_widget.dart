import 'package:brain_check/domain/models/game_room_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({
    super.key,
    required this.room,
    required this.index,
  });

  final GameRoomModel room;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 93, 158, 190),
              Color.fromARGB(180, 66, 120, 255),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    index.toString(),
                    style: GoogleFonts.bungee(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height / 55),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  child: Text(
                    "${room.playersAmount}/2",
                    style: GoogleFonts.bungee(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height / 55),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              room.name,
              style: GoogleFonts.bungee(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height / 40),
            ),
          ],
        ),
      ),
    );
  }
}
