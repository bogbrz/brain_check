import 'package:brain_check/app/features/pages/pre_game_page.dart';
import 'package:brain_check/app/features/pages/settings_page.dart';
import 'package:flutter/material.dart';





class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BRAIN CHECK APP",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => SettingsPage())));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          )
        ],
        backgroundColor: Color.fromARGB(255, 27, 58, 93),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
          ),
          Center(
            child: Material(
              shadowColor: Colors.white70,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PreGamePage()));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 4, color: Colors.black)),
                  child: Text("START",
                      style: Theme.of(context).textTheme.displayMedium),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
