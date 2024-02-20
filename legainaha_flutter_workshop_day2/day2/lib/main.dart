import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const GamePage());
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  var leftaImageNumber = 3;
  var riightImageNumber = 2;
  var score = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff3278A1).withOpacity(.5),
        appBar: AppBar(
          title: const Text(
            "Matching Pictures",
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xff3278A1).withOpacity(.01),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Score: $score",
                style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              leftaImageNumber == riightImageNumber
                  ? "Well Done !"
                  : "Try Again",
              style: const TextStyle(
                  fontSize: 42.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Image.asset("lib/images/image-$leftaImageNumber.png"),
                ),
                Expanded(
                  child: Image.asset("lib/images/image-$riightImageNumber.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    riightImageNumber = Random().nextInt(3) + 1;
                    leftaImageNumber = Random().nextInt(3) + 1;
                    if (leftaImageNumber == riightImageNumber) {
                      score = score + 1;
                    }
                  });
                },
                child: const Text(
                  "Play",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff3278A1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
