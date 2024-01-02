import 'package:flutter/material.dart';

class PreGamePage extends StatelessWidget {
  const PreGamePage({
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
        backgroundColor: Color.fromARGB(255, 27, 58, 93),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Choose category:",
                style: Theme.of(context).textTheme.displayMedium),
            Text("Choose difficulty:",
                style: Theme.of(context).textTheme.displayMedium),
            Container(
              width: MediaQuery.of(context).size.width / 1.75,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 4, color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Easy", style: Theme.of(context).textTheme.displaySmall),
                  Image(
                    image: AssetImage("images/leave.png"),
                    width: MediaQuery.of(context).size.width / 8,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.75,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 4, color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Medium",
                      style: Theme.of(context).textTheme.displaySmall),
                  Image(
                    image: AssetImage("images/bitten_leaf_scaled.png"),
                    width: MediaQuery.of(context).size.width / 8,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.75,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 4, color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hard", style: Theme.of(context).textTheme.displaySmall),
                  Image(
                    image: AssetImage("images/fire_leaf_scale.png"),
                    width: MediaQuery.of(context).size.width / 8,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
