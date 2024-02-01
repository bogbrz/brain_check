import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/set_up_user_page/cubit/set_up_user_cubit.dart';
import 'package:brain_check/navigator_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SetUpUserPage extends StatelessWidget {
  const SetUpUserPage({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocProvider(
      create: (context) => getIt<SetUpUserCubit>()
        ..getRankingForUpdate(email: user!.email.toString()),
      child: BlocBuilder<SetUpUserCubit, SetUpUserState>(
        builder: (context, state) {
          if (state.profile.isNotEmpty) {
            return NavigatorPage(user: user);
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 27, 58, 93),
            ),
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 8,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add profile picture",
                      style: GoogleFonts.bungee(fontSize: 20),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: MediaQuery.of(context).size.width * 0.22,
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 56, 113, 178),
                        radius: MediaQuery.of(context).size.width * 0.2,
                        child: const Icon(
                          Icons.add_outlined,
                          size: 60,
                        ),
                      ),
                    ),
                    Text(
                      "Set your nickname",
                      style: GoogleFonts.bungee(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLength: 15,
                        style: GoogleFonts.bungee(fontSize: 20),
                        decoration: InputDecoration(
                            hintText: "NickName",
                            hintStyle: GoogleFonts.bungee(),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 8)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 8))),
                        controller: controller,
                      ),
                    ),
                    InkWell(
                        onTap: controller.text.isEmpty
                            ? null
                            : () {
                                context
                                    .read<SetUpUserCubit>()
                                    .addProfileToGlobalRanking(
                                        nickName: controller.text,
                                        email: user!.email.toString());
                              },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.075,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 8,
                                )),
                            child: Center(
                                child: Text(
                              "SET",
                              style: GoogleFonts.bungee(fontSize: 25),
                            ))))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
   
  }
}
