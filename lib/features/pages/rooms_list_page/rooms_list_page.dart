import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/domain/models/profile_model.dart';

import 'package:brain_check/features/pages/rooms_list_page/cubit/rooms_list_page_cubit.dart';
import 'package:brain_check/features/pages/rooms_list_page/widgets/create_room_widget.dart';
import 'package:brain_check/features/pages/rooms_list_page/widgets/join_room_widget.dart';
import 'package:brain_check/features/pages/rooms_list_page/widgets/room_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsListPage extends StatelessWidget {
  RoomsListPage({
    required this.profile,
    required this.user,
    super.key,
  });

  final ProfileModel profile;

  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<RoomsListPageCubit>()..getRooms(),
        child:
            Scaffold(body: BlocBuilder<RoomsListPageCubit, RoomsListPageState>(
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
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 0, 27, 48),
                        Color.fromARGB(180, 66, 120, 255),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back_sharp),
                              color: Colors.white,
                              iconSize:
                                  MediaQuery.of(context).size.height * 0.05,
                            )
                          ],
                        ),
                      ),
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
                                            nickName: profile.nickName,
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
                        nickName: profile.nickName,
                      )
                    ],
                  ),
                );
            }
          },
        )));
  }
}
