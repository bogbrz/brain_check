
import 'package:brain_check/features/pages/user_page/cubit/user_page_cubit.dart';



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';



class SignOutWidget extends StatelessWidget {
  const SignOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.read<UserPageCubit>().signOut();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 27, 58, 93),
              border: Border.all(width: MediaQuery.of(context).size.width / 45),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            "Log out",
            style: GoogleFonts.bungee(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height / 35),
          ),
        ));
  }
}
