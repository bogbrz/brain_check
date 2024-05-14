import 'package:brain_check/domain/models/amount_button_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';





class AmountWidget extends StatelessWidget {
  const AmountWidget({
    super.key,
    required this.amount,
    required this.choosedAmount,
  });

  final AmountModel amount;
  final int? choosedAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: choosedAmount == null
            ? MediaQuery.of(context).size.height * 0.1
            : choosedAmount == amount.nameId
                ? MediaQuery.of(context).size.height * 0.15
                : MediaQuery.of(context).size.height * 0.1,
        width: choosedAmount == null
            ? MediaQuery.of(context).size.width * 0.24
            : choosedAmount == amount.nameId
                ? MediaQuery.of(context).size.width * 0.35
                : MediaQuery.of(context).size.width * 0.21,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(180, 66, 120, 255),
            ],
          ),
        ),
        child: Text(
          amount.name == "Survival"
              ? AppLocalizations.of(context).survival
              : amount.name,
          style: GoogleFonts.bungee(
              fontSize: choosedAmount == null
                  ? MediaQuery.of(context).size.width / 35
                  : choosedAmount == amount.nameId && amount.nameId != 0
                      ? MediaQuery.of(context).size.width / 10
                      : choosedAmount == amount.nameId && amount.nameId == 0
                          ? MediaQuery.of(context).size.width / 20
                          : MediaQuery.of(context).size.width / 35),
        ));
  }
}

