
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/game_room_model.dart';
import 'package:brain_check/features/pages/duel_page/cubit/duel_page_cubit.dart';
import 'package:brain_check/features/pages/duel_room_page/duel_room_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DuelPage extends StatelessWidget {
  DuelPage({
    required this.nickName,
    required this.email,
    required this.user,
    super.key,
  });
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passControler = TextEditingController();
  final String nickName;
  final String email;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<DuelPageCubit>()..getRooms(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 27, 58, 93),
            ),
            body: BlocBuilder<DuelPageCubit, DuelPageState>(
              builder: (context, state) {
                switch (state.status) {
                  case Status.initial:
                    return const InitialStateWidget();
                  case Status.loading:
                    return const LoadingStateWidget();
                  case Status.error:
                    return ErrorStateWidget(
                        errorMessage: state.errorMessage.toString());
                  case Status.success:
                    return Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: state.rooms.length,
                                itemBuilder: (context, index) {
                                  final room = state.rooms[index];
                                  int i = index + 1;
                                  return InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return JoinRoomWidget(
                                              email: room.ownerMail,
                                              nickName: nickName,
                                              model: room,
                                              id: room.id,
                                              user: user,
                                            );
                                          });
                                    },
                                    child: RoomWidget(
                                      room: room,
                                      index: i,
                                    ),
                                  );
                                })),
                        CreateRoomWidget(
                          email: email,
                          nameController: nameController,
                          passControler: passControler,
                          nickName: nickName,
                          user: user,
                      
                        )
                      ],
                    );
                }
              },
            )));
  }
}

class JoinRoomWidget extends StatelessWidget {
  JoinRoomWidget({
    required this.nickName,
    required this.model,
    required this.email,
    required this.id,
    required this.user,
    super.key,
  });
  final String nickName;
  final GameRoomModel model;
  final String email;
  final String id;
  final User? user;

  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        "$nickName's room",
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
                  print("DUPA");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GameRoomPage(
                            user: user,
                            id: id,
                            email: email,
                            nickName: nickName,
                          )));
                  passwordController.clear();
                } else {
                  passwordController.clear();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Wrong password"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text("Join"))
        ],
      )),
    );
  }
}

class RoomWidget extends StatelessWidget {
  const RoomWidget({super.key, required this.room, required this.index});

  final GameRoomModel room;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
              border: Border.all(
                  width: MediaQuery.of(context).size.width * 0.01,
                  color: Colors.white)),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      index.toString(),
                      style: GoogleFonts.bungee(
                          color: Colors.white,
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
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 55),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateRoomWidget extends StatelessWidget {
  const CreateRoomWidget({
    super.key,
    required this.nameController,
    required this.passControler,
    required this.nickName,
    required this.email,
    required this.user,
   
  });

  final TextEditingController nameController;
  final TextEditingController passControler;
  final String nickName;
  final String email;
  final User? user;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
              onPressed:  () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BlocProvider(
                        create: (context) => getIt<DuelPageCubit>(),
                        child: AlertDialog(
                          scrollable: true,
                          title: const Text("Create new game"),
                          content: Form(
                            child: Column(children: [
                              const Row(
                                children: [
                                  Text("Room name"),
                                ],
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width:
                                        MediaQuery.of(context).size.width / 85,
                                  )),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width:
                                        MediaQuery.of(context).size.width / 85,
                                  )),
                                ),
                                controller: nameController,
                              ),
                              const Row(
                                children: [
                                  Text("Password"),
                                ],
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width:
                                        MediaQuery.of(context).size.width / 85,
                                  )),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width:
                                        MediaQuery.of(context).size.width / 85,
                                  )),
                                ),
                                controller: passControler,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      BlocBuilder<DuelPageCubit, DuelPageState>(
                                    builder: (context, state) {
                                      return ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<DuelPageCubit>()
                                                .createRoom(
                                                  name: nameController.text,
                                                  password: passControler.text,
                                                  nickName: nickName,
                                                );
                                            nameController.clear();
                                            passControler.clear();
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Create"));
                                    },
                                  ))
                            ]),
                          ),
                        ),
                      );
                    });
              },
              label: const Row(
                children: [Text("Create new room"), Icon(Icons.add)],
              )),
        ],
      ),
    );
  }
}
