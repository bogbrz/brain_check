import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/domain/models/profile_model.dart';

import 'package:brain_check/features/pages/result_page/cubit/result_page_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FinishButtonWidget extends StatefulWidget {
  const FinishButtonWidget({
    super.key,
    required this.points,
    required this.profiles,
    required this.isRanked,
    required this.isDuel,
    required this.players,
    required this.roomId,
    required this.user,
  });

  final int points;
  final List<ProfileModel> profiles;
  final bool isRanked;
  final bool isDuel;
  final List<PlayerModel>? players;
  final String? roomId;
  final User? user;

  @override
  State<FinishButtonWidget> createState() => _FinishButtonWidgetState();
}

class _FinishButtonWidgetState extends State<FinishButtonWidget> {
  @override
  var isFinished = false;
  Widget build(BuildContext context) {
    return Material(
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              isFinished = true;
            });
            if (widget.isRanked) {
              context.read<ResultPageCubit>().updateRanking(
                  points: widget.points, id: widget.profiles[0].id);

              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 27, 58, 93),
                border: Border.all(
                  width: MediaQuery.of(context).size.width / 55,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              AppLocalizations.of(context).finish,
              style: GoogleFonts.bungee(
                  fontSize: MediaQuery.of(context).size.height / 25,
                  color: Colors.white),
            ),
          ),
        ));
  }
}
