import 'package:brain_check/domain/models/overall_info_model.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PageExtrasWidget extends StatefulWidget {
  const PageExtrasWidget(
      {super.key,
      required this.user,
      required this.overall,
      required this.profile});

  final User? user;
  final Overall overall;
  final ProfileModel profile;

  @override
  State<PageExtrasWidget> createState() => _PageExtrasWidgetState();
}

class _PageExtrasWidgetState extends State<PageExtrasWidget>
    with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  )..repeat(reverse: true);
  @override
  Widget build(BuildContext context) {
    late final Animation<Offset> _offsetAnimation = Tween<Offset>(
      begin: Offset(0, -0.2),
      end: Offset(0.0, 0.2),
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.elasticIn));
    ;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _offsetAnimation,
          child: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: const Image(
                  image: AssetImage("images/brain_question_white.png"))),
        ),
        Center(
          child: Column(
            children: [
              Text(
                "${AppLocalizations.of(context).welcomeBack} ${widget.profile.nickName}",
                textAlign: TextAlign.center,
                style: GoogleFonts.bungee(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 15),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
