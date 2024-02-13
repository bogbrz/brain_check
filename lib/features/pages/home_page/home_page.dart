import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';

import 'package:brain_check/features/pages/home_page/cubit/home_page_cubit.dart';
import 'package:brain_check/features/pages/home_page/widgets/button_widget.dart';
import 'package:brain_check/features/pages/home_page/widgets/page_extras_widget.dart';

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
        child: BlocBuilder<HomePageCubit, HomePageState>(
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
              return Scaffold(
                  appBar: AppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "BRAIN CHECK APP",
                          style: GoogleFonts.bungee(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width / 15),
                        ),
                        Row(
                          children: [
                            Image(
                              image: AssetImage("images/brain.png"),
                              width: MediaQuery.of(context).size.width / 10,
                            ),
                            Text(
                              state.profile[0].lifes.toString(),
                              style: GoogleFonts.bungee(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 15),
                            )
                          ],
                        )
                      ],
                    ),
                    backgroundColor: const Color.fromARGB(255, 27, 58, 93),
                  ),
                  body: Column(
                    children: [
                      PageExtrasWidget(
                        profiles: state.profile,
                        user: user,
                        overall: state.overAllInfo,
                      ),
                      StartButtonWidget(
                        user: user,
                      ),
                    ],
                  ));
          }
        }));
  }
}
