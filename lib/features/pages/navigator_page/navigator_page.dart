import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage(
      {required this.user, Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey<String>("NavigatorPage"));
  final User? user;
  final StatefulNavigationShell navigationShell;

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.center,
          colors: [
            Color.fromARGB(255, 0, 27, 48),
            Color.fromARGB(180, 66, 120, 255),
          ],
        )),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          selectedLabelStyle: GoogleFonts.bungee(),
          unselectedLabelStyle: GoogleFonts.bungee(),
          onTap: (newIndex) {
            setState(() {
              pageIndex = newIndex;
            });
            _onTap(context, newIndex);
          },
          currentIndex: pageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage("images/house.png"),
                width: pageIndex == 0
                    ? MediaQuery.of(context).size.height / 20
                    : MediaQuery.of(context).size.height / 30,
              ),
              label: AppLocalizations.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage("images/trophy.png"),
                width: pageIndex == 1
                    ? MediaQuery.of(context).size.height / 20
                    : MediaQuery.of(context).size.height / 35,
              ),
              label: AppLocalizations.of(context).ranking,
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage("images/user.png"),
                width: pageIndex == 2
                    ? MediaQuery.of(context).size.height / 20
                    : MediaQuery.of(context).size.height / 30,
              ),
              label: AppLocalizations.of(context).user,
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
