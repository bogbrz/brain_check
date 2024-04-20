import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';

import 'package:brain_check/features/pages/set_up_user_page/cubit/set_up_user_cubit.dart';
import 'package:brain_check/features/pages/set_up_user_page/widgets/user_info_widget.dart';

import 'package:brain_check/navigator_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetUpUserPage extends StatefulWidget {
  const SetUpUserPage({
    super.key,
    required this.user,
  });
  final User? user;

  @override
  State<SetUpUserPage> createState() => _SetUpUserPageState();
}

class _SetUpUserPageState extends State<SetUpUserPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<SetUpUserCubit>()
          ..getRankingForUpdate(email: widget.user!.email.toString()),
        child: Scaffold(
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
              child: BlocBuilder<SetUpUserCubit, SetUpUserState>(
                builder: (context, state) {
                  print(state.uploadImageUrl);
                  if (state.profile.isNotEmpty) {
                    return NavigatorPage(
                      user: widget.user,
                    );
                  }
                  
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 251, 251, 251),
                          Color.fromARGB(180, 66, 120, 255),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserInfoWidget(
                          user: widget.user,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
