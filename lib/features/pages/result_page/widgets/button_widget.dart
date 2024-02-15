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
    required this.isRanked,
  });

  final int points;
  final List<ProfileModel> profiles;
  final bool isRanked;

  @override
  Widget build(BuildContext context) {
    return Material(
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            if (isRanked) {
              context
                  .read<ResultPageCubit>()
                  .updateRanking(points: points, id: profiles[0].id);

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
              "FINISH",
              style: GoogleFonts.bungee(
                  fontSize: MediaQuery.of(context).size.height / 25,
                  color: Colors.white),
            ),
          ),
        ));
  }
}
