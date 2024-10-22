import 'package:day2/page_view_screens/main/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Challenge());
}

class Challenge extends StatelessWidget {
  const Challenge({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class LayoutChallenge extends StatelessWidget {
  const LayoutChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          rowWith2Columns(context, Colors.red, Colors.green),
          rowWith2Columns(context, Colors.blue, Colors.amber),
          rowWith2Columns(context, Colors.purple, Colors.deepOrange),
        ],
      ),
    );
  }

  Row rowWith2Columns(BuildContext context, Color color1, Color color2) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                color: color1,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                color: color2,
              )
            ],
          ),
        ),
      ],
    );
  }
}
