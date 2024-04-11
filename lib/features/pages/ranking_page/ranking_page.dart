import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/app/injection_container.dart';

import 'package:brain_check/features/pages/ranking_page/cubit/ranking_page_cubit.dart';
import 'package:brain_check/features/pages/ranking_page/widgets/label_widget.dart';
import 'package:brain_check/features/pages/ranking_page/widgets/ranking_profile_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RankingPage extends StatelessWidget {
  RankingPage({super.key});
  final TextStyle bungee = GoogleFonts.bungee();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RankingPageCubit>()..getRanking(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 58, 93),
          centerTitle: true,
          title: Text(AppLocalizations.of(context).ranking,
              style: GoogleFonts.bungee(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height / 25,
              )),
        ),
        body: BlocBuilder<RankingPageCubit, RankingPageState>(
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
                return Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 0, 27, 48),
                      Color.fromARGB(180, 66, 120, 255),
                    ],
                  )),
                  child: Column(
                    children: [
                      const LabelWidget(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.profiles.length,
                          itemBuilder: (context, index) {
                            final profile = state.profiles[index];
                            int i = index + 1;
                            return RankingProfileWidget(
                                i: i, bungee: bungee, profile: profile);
                          },
                        ),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
