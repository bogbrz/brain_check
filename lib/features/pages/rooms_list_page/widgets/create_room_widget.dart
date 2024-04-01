import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/game_room_model.dart';

import 'package:brain_check/features/pages/duel_room_page/duel_room_page.dart';
import 'package:brain_check/features/pages/rooms_list_page/cubit/rooms_list_page_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateRoomWidget extends StatelessWidget {
  CreateRoomWidget({super.key, required this.nickName, required this.rooms});

  final String nickName;
  final List<GameRoomModel> rooms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BlocProvider(
                        create: (context) => getIt<RoomsListPageCubit>(),
                        child: AlertDialog(
                          scrollable: true,
                          title: Text(
                            AppLocalizations.of(context).createNewRoom,
                            style: GoogleFonts.bungee(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 50),
                          ),
                          content: DialogContetWidget(
                            nickName: nickName,
                            rooms: rooms,
                          ),
                        ),
                      );
                    });
              },
              label: Row(
                children: [
                  Text(
                    AppLocalizations.of(context).createNewRoom,
                    style: GoogleFonts.bungee(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height / 50),
                  ),
                  Icon(Icons.add)
                ],
              )),
        ],
      ),
    );
  }
}

class DialogContetWidget extends StatefulWidget {
  DialogContetWidget({
    super.key,
    required this.nickName,
    required this.rooms,
  });
  final String nickName;
  final List<GameRoomModel> rooms;

  @override
  State<DialogContetWidget> createState() => _DialogContetWidgetState();
}

class _DialogContetWidgetState extends State<DialogContetWidget> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController passControler = TextEditingController();

  @override
  void initState() {
    nameController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context).roomName,
              style: GoogleFonts.bungee(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height / 50),
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
          controller: nameController,
        ),
        Row(
          children: [
            Text(
              AppLocalizations.of(context).password,
              style: GoogleFonts.bungee(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height / 50),
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
          controller: passControler,
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<RoomsListPageCubit, RoomsListPageState>(
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: nameController.text.isEmpty
                        ? null
                        : widget.rooms.any((element) =>
                                element.name == nameController.text)
                            ? null
                            : () {
                                context.read<RoomsListPageCubit>().createRoom(
                                      name: nameController.text,
                                      password: passControler.text,
                                      nickName: widget.nickName,
                                    );
                                nameController.clear();
                                passControler.clear();
                                Navigator.of(context).pop();
                              },
                    child: Text(
                      AppLocalizations.of(context).create,
                      style: GoogleFonts.bungee(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height / 50),
                    ));
              },
            ))
      ]),
    );
  }
}
