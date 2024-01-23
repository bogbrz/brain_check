import 'package:brain_check/app/global%20cubit/cubit/user_page_cubit.dart';
import 'package:brain_check/app/injection_container.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    required this.user,
    super.key,
  });
  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserPageCubit>()..getProfile(),
      child: BlocBuilder<UserPageCubit, UserPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "User info",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Color.fromARGB(255, 27, 58, 93),
            ),
            body: Center(
              child: Container(
                padding: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (final profile in state.profile) ...[
                      Text("Your email adress: ${user!.email}",
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text("Your nickname: ${profile.nickName}",
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text("Quiz played:  ",
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text("Personal rating: ${profile.points}",
                          style: Theme.of(context).textTheme.headlineMedium),
                    ],
                    ElevatedButton(
                        onPressed: () {
                          context.read<UserPageCubit>().signOut();
                        },
                        child: Text("Log out"))
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
