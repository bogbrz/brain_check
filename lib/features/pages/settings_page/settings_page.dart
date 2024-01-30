
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/settings_page/cubit/settings_page_cubit.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
    required this.user,
  });
  final User? user;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    if (user == null) {
      return Center(
        child: Text("YOU ARE NOT LOGGED IN"),
      );
    }
    return BlocProvider(
      create: (context) => getIt<SettingsPageCubit>()
        ..getRankingForUpdate(email: user!.email.toString()),
      child: BlocBuilder<SettingsPageCubit, SettingsPageState>(
        builder: (context, state) {
          if (state.profile.isNotEmpty) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 27, 58, 93),
              ),
              body: Center(
                child: Text("Settings"),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 27, 58, 93),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(controller: controller),
                  ElevatedButton(
                      onPressed: () {
                      
                        context
                            .read<SettingsPageCubit>()
                            .addProfileToGlobalRanking(
                                nickName: controller.text,
                                email: user!.email.toString());
                      },
                      child: Text("SET"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
