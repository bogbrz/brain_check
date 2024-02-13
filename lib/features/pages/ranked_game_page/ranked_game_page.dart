
import 'package:flutter/material.dart';

class RankedGamePage extends StatelessWidget {
  const RankedGamePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor:
                const Color.fromARGB(255, 27, 58, 93),
          ),
          body: Center(
            child: Text("RANKED GAME PAGE"),
          ),
        );
  }
}
