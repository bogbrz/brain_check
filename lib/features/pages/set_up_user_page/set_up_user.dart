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
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

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
                  if (state.profile.isNotEmpty) {
                    return NavigatorPage(
                      user: widget.user,
                    );
                  }
                  switch (state.status) {
                    case Status.initial:
                      return const InitialStateWidget();
                    case Status.loading:
                      return const LoadingStateWidget();

                    case Status.error:
                      return ErrorStateWidget(
                          errorMessage: state.errorMessage.toString());
                    case Status.success:
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 8,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UserInfoWidget(
                              controller: controller,
                            ),
                            InkWell(
                                onTap: controller.text.isEmpty
                                    ? null
                                    : () {
                                        context
                                            .read<SetUpUserCubit>()
                                            .addProfileToGlobalRanking(
                                              nickName: controller.text,
                                              email:
                                                  widget.user!.email.toString(),
                                            );
                                      },
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.075,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 8,
                                        )),
                                    child: Center(
                                        child: Text(
                                      AppLocalizations.of(context).set,
                                      style: GoogleFonts.bungee(fontSize: 25),
                                    ))))
                          ],
                        ),
                      );
                  }
                },
              ),
            ),
          ),
        ));
  }
}
