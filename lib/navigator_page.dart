import 'package:brain_check/features/pages/home_page/home_page.dart';
import 'package:brain_check/features/pages/ranking_page/ranking_page.dart';
import 'package:brain_check/features/pages/user_page/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({
    required this.user,
    super.key,
  });
  final User? user;

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  var pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (pageIndex == 0) {
          return HomePage(
            user: widget.user,
          );
        } else if (pageIndex == 2) {
          return UserPage(
            user: widget.user,
          );
        } else {
          return RankingPage();
        }
      }),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          selectedLabelStyle: GoogleFonts.bungee(),
          unselectedLabelStyle: GoogleFonts.bungee(),
          backgroundColor: const Color.fromARGB(255, 27, 58, 93),
          onTap: (newIndex) {
            setState(() {
              pageIndex = newIndex;
            });
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
}
