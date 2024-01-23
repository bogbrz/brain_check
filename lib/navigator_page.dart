import 'package:brain_check/features/pages/home_page.dart';
import 'package:brain_check/features/pages/user_page/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        } else {
          return UserPage(
            user: widget.user,
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 27, 58, 93),
        onTap: (newIndex) {
          setState(() {
            pageIndex = newIndex;
          });
        },
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: "USER",
          ),
        ],
      ),
    );
  }
}
