import 'package:flutter/material.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemBuilder: (context, i) {
                  return UnconstrainedBox(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          color = colors[i];
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: colors[i],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 250,
              child: FloatingActionButton(
                backgroundColor: Colors.redAccent,
                onPressed: () {
                  setState(() {
                    color = Colors.white;
                  });
                },
                child: const Text(
                  "Reset Background Color",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Color> colors = [
  Colors.amber,
  Colors.brown,
  Colors.teal,
  Colors.lightGreenAccent,
  Colors.cyan,
  Colors.deepPurple,
  Colors.orange,
  Colors.purple,
  Colors.green,
  Colors.black,
  Colors.red,
];
