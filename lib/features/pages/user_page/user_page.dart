
import 'package:brain_check/features/pages/user_page/widgets/profile_info_widget.dart';
import 'package:brain_check/features/pages/user_page/widgets/sign_out_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    required this.user,
    super.key,
  });
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 0, 27, 48),
          Color.fromARGB(180, 66, 120, 255),
        ],
      )),
      child: Center(
        child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(180, 66, 120, 255),
                  ],
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                ProfileInfoWidget(
                  user: user,
                ),
                const SignOutWidget()
              ],
            )),
      ),
    ));
  }
}
