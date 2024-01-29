import 'package:brain_check/app/global%20cubit/cubit/global_user_cubit.dart';
import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/settings_page/cubit/settings_page_cubit.dart';
import 'package:brain_check/features/pages/user_page/user_page.dart';
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
    return BlocBuilder<GlobalUserCubit, GlobalUserState>(
      builder: (context, state) {
        context.read<GlobalUserCubit>().getProfile();
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
                      context.read<GlobalUserCubit>().addProfile(
                          nickName: controller.text,
                          email: user!.email.toString());
                      context.read<GlobalUserCubit>().addProfileToGlobalRanking(
                          nickName: controller.text,
                          email: user!.email.toString());
                    },
                    child: Text("SET"))
              ],
            ),
          ),
        );
      },
    );
  }
}
