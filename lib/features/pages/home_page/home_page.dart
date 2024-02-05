import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/categories_page/categories_page.dart';
import 'package:brain_check/features/pages/home_page/cubit/home_page_cubit.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.user,
  });
  final User? user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomePageCubit>()
        ..getRankingForUpdate(email: user!.email.toString()),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "BRAIN CHECK APP",
              style: GoogleFonts.bungee(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width / 12),
            ),
            backgroundColor: const Color.fromARGB(255, 27, 58, 93),
          ),
          body: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final profile in state.profile) ...[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Center(
                          child: Text(
                            '''Welcome back ${profile.nickName}''',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bungee(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                  Center(
                    child: Material(
                      shadowColor: Colors.white70,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CategoryPage(
                                    user: user,
                                  )));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: MediaQuery.of(context).size.width / 40),
                          ),
                          child: Text("PLAY",
                              style: GoogleFonts.bungee(fontSize: 45)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ],
              );
            },
          )),
    );
  }
}
