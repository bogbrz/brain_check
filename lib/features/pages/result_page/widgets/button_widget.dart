import 'package:brain_check/domain/models/profile_model.dart';

import 'package:brain_check/features/pages/result_page/cubit/result_page_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FinishButtonWidget extends StatelessWidget {
  const FinishButtonWidget({
    super.key,
    required this.points,
    required this.profiles,
  });

  final int points;
  final List<ProfileModel> profiles;

  @override
  Widget build(BuildContext context) {
    return Material(
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            for (final profile in profiles) {
              context
                  .read<ResultPageCubit>()
                  .updateRanking(points: points, id: profile.id);
            }

            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
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
              "FINISH",
              style: GoogleFonts.bungee(
                  fontSize: MediaQuery.of(context).size.height / 25,
                  color: Colors.white),
            ),
          ),
        ));
  }
}
