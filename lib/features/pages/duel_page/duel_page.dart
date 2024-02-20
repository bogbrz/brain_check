import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/game_room_model.dart';
import 'package:brain_check/features/pages/duel_page/cubit/duel_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DuelPage extends StatelessWidget {
  DuelPage({
    super.key,
  });
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passControler = TextEditingController();

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
                    return InitialStateWidget();
                  case Status.loading:
                    return LoadingStateWidget();
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
                                  return RoomWidget(
                                    room: room,
                                    index: i,
                                  );
                                })),
                        CreateRoomWidget(
                            nameController: nameController,
                            passControler: passControler)
                      ],
                    );
                }
              },
            )));
  }
}

class RoomWidget extends StatelessWidget {
  const RoomWidget({super.key, required this.room, required this.index});

  final GameRoomModel room;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          children: [
            Row(
              children: [Text(index.toString())],
            ),
            Text(room.name),
          ],
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
  });

  final TextEditingController nameController;
  final TextEditingController passControler;

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
                        create: (context) => getIt<DuelPageCubit>(),
                        child: AlertDialog(
                          scrollable: true,
                          title: Text("Create new game"),
                          content: Form(
                            child: Column(children: [
                              Row(
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
                              Row(
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
                                                    password:
                                                        passControler.text);

                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Create"));
                                    },
                                  ))
                            ]),
                          ),
                        ),
                      );
                    });
              },
              label: Row(
                children: [Text("Create new room"), Icon(Icons.add)],
              )),
        ],
      ),
    );
  }
}
