import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/game_room_model.dart';

import 'package:brain_check/features/pages/duel_room_page/duel_room_page.dart';
import 'package:brain_check/features/pages/rooms_list_page/cubit/rooms_list_page_cubit.dart';
import 'package:brain_check/features/pages/rooms_list_page/widgets/create_room_widget.dart';
import 'package:brain_check/features/pages/rooms_list_page/widgets/join_room_widget.dart';
import 'package:brain_check/features/pages/rooms_list_page/widgets/room_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomsListPage extends StatelessWidget {
  RoomsListPage({
    required this.nickName,
    required this.user,
    super.key,
  });

  final String nickName;

  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<RoomsListPageCubit>()..getRooms(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 27, 58, 93),
            ),
            body: BlocBuilder<RoomsListPageCubit, RoomsListPageState>(
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
                                              room: room,
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
                          rooms: state.rooms,
                          nickName: nickName,
                        )
                      ],
                    );
                }
              },
            )));
  }
}




