import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Status { initial, loading, success, error }

enum GameType { casual, duel, ranked }

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({required this.errorMessage, super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
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
      child: Center(
        child: Text("Error : $errorMessage"),
      ),
    );
  }
}

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(scale: 2, child: const CircularProgressIndicator()),
          Text(
            AppLocalizations.of(context).gatheringData,
            style: GoogleFonts.bungee(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height / 25),
          )
        ],
      ),
    );
  }
}

class LoadingPictureWidget extends StatelessWidget {
  const LoadingPictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: CircularProgressIndicator(),
    );
  }
}

class InitialStateWidget extends StatelessWidget {
  const InitialStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Center(
          child: Text(
        AppLocalizations.of(context).initialing,
      )),
    );
  }
}
