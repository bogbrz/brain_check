import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/user_page/cubit/user_page_cubit.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    required this.user,
    super.key,
  });
  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserPageCubit>()
        ..getRankingForUpdate(email: user!.email.toString()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "User info",
            style: GoogleFonts.bungee(color: Colors.white, fontSize: 35),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 27, 58, 93),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(width: MediaQuery.of(context).size.width / 45),
                borderRadius: BorderRadius.circular(10)),
            child: BlocBuilder<UserPageCubit, UserPageState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 27, 58, 93),
                      radius: 40,
                    ),
                    for (final profile in state.profile) ...[
                      Text("Your nickname: ${profile.nickName}",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.bungee(
                              fontSize:
                                  MediaQuery.of(context).size.height / 35)),
                      Text(
                        "Your email adress: ${user!.email}",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 35),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Quiz played: ${profile.gamesPlayed} ",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 35),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Personal rating: ${profile.points}",
                        style: GoogleFonts.bungee(
                            fontSize: MediaQuery.of(context).size.height / 35),
                        textAlign: TextAlign.left,
                      ),
                    ],
                    InkWell(
                        onTap: () {
                          context.read<UserPageCubit>().signOut();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 27, 58, 93),
                              border: Border.all(
                                  width:
                                      MediaQuery.of(context).size.width / 45),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Log out",
                            style: GoogleFonts.bungee(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 35),
                          ),
                        ))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
