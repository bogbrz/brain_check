
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigatorPage extends StatefulWidget {
  NavigatorPage({required this.user, Key? key, required this.navigationShell})
      : super(key: key ?? ValueKey<String>("NavigatorPage"));
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
      // Builder(builder: (context) {
      //   if (pageIndex == 0) {
      //     return HomePage(
      //       user: widget.user,
      //     );
      //   } else if (pageIndex == 2) {
      //     return UserPage(
      //       user: widget.user,
      //     );
      //   } else {
      //     return RankingPage();
      //   }
      // }),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
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
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
