import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';

import 'package:brain_check/features/pages/user_page/cubit/user_page_cubit.dart';
import 'package:brain_check/features/pages/user_page/widgets/profile_info_widget.dart';
import 'package:brain_check/features/pages/user_page/widgets/sign_out_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    required this.user,
    super.key,
  });
  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserPageCubit>()
        ..getRankingForUpdate(email: user!.email.toString()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).user,
            style: GoogleFonts.bungee(color: Colors.white, fontSize: 35),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 27, 58, 93),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(width: MediaQuery.of(context).size.width / 45),
                borderRadius: BorderRadius.circular(10)),
            child: BlocBuilder<UserPageCubit, UserPageState>(
              builder: (context, state) {
                switch (state.status) {
                  case Status.initial:
                    return const InitialStateWidget();
                  case Status.loading:
                    return const LoadingStateWidget();

                  case Status.error:
                    return ErrorStateWidget(
                        errorMessage: state.errorMessage.toString());
                  case Status.success:
                    return Column(
                      children: [
                        ProfileInfoWidget(
                          user: user,
                          profiles: state.profile,
                        ),
                        const SignOutWidget()
                      ],
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
