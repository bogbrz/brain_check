import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Status { initial, loading, success, error }

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({required this.errorMessage, super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Error : ${errorMessage}"),
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
          Transform.scale(scale: 2, child: CircularProgressIndicator()),
          Text(
            "Gathering data",
            style: GoogleFonts.bungee(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height / 25),
          )
        ],
      ),
    );
  }
}

class InitialStateWidget extends StatelessWidget {
  const InitialStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Initialing"));
  }
}


