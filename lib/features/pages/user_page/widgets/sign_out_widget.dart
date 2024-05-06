import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/user_page/cubit/user_page_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignOutWidget extends StatelessWidget {
  const SignOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserPageCubit>(),
      child: BlocBuilder<UserPageCubit, UserPageState>(
        builder: (context, state) {
          return InkWell(
              onTap: () {
                print("${FirebaseAuth.instance.currentUser!.email}");

                context.read<UserPageCubit>().signOut();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 27, 58, 93),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(255, 22, 72, 234),
                        Color.fromARGB(180, 66, 120, 255),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  AppLocalizations.of(context).logOut,
                  style: GoogleFonts.bungee(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height / 35),
                ),
              ));
        },
      ),
    );
  }
}
