import 'package:brain_check/app/injection_container.dart';
import 'package:brain_check/features/pages/ranking_page/cubit/ranking_page_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RankingPageCubit>()..getRanking(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("RANKING"),
        ),
        body: BlocBuilder<RankingPageCubit, RankingPageState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Nickname"),
                      Text("Games played"),
                      Text("Score")
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(children: [
                    for (final profile in state.profiles) ...[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(profile.nickName),
                            Text(profile.gamesPlayed.toString()),
                            Text(profile.points.toString())
                          ],
                        ),
                      )
                    ]
                  ]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
