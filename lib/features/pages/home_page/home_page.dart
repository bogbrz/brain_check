import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';

import 'package:brain_check/features/pages/home_page/cubit/home_page_cubit.dart';
import 'package:brain_check/features/pages/home_page/widgets/button_widget.dart';
import 'package:brain_check/features/pages/home_page/widgets/page_extras_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
    required this.user,
  });
  final User? user;
  final DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<HomePageCubit>()
          ..getRankingForUpdate(
              email: user!.email.toString(), userId: user!.uid),
        child: BlocConsumer<HomePageCubit, HomePageState>(
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return const InitialStateWidget();

                case Status.error:
                  return ErrorStateWidget(
                      errorMessage: state.errorMessage.toString());
                case Status.loading:
                  return const LoadingStateWidget();
                case Status.success:
            

                  return Scaffold(
                      body: Container(
                    decoration: const BoxDecoration(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PageExtrasWidget(
                          profile: state.profile[0],
                          user: user,
                          overall: state.overAllInfo,
                        ),
                        StartButtonWidget(
                          user: user,
                          profile: state.profile[0],
                        ),
                      ],
                    ),
                  ));
              }
            }));
  }
}
