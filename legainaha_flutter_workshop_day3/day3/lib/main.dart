import 'package:day3/challenge/challenge.dart';
import 'package:flutter/material.dart';

Map<String, bool> gameScore = {};
Map<String, Color> buzzlle = {
  'Red': Colors.red,
  'White': Colors.white,
  'Purple': Colors.purple,
};

void main() {
  runApp(const Game());
}

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DDGame(),
      home: Challenge(),
    );
  }
}

class DDGame extends StatefulWidget {
  const DDGame({super.key});

  @override
  State<DDGame> createState() => _DDGameState();
}

class _DDGameState extends State<DDGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6CC5E6),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Score ${gameScore.length} / 3',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            gameScore.clear();
          });
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(
          Icons.restore_sharp,
          color: Colors.white,
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: _dragArea(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: buzzlle.keys.map((e) => _targetArea(e)).toList()
                ..shuffle(),
            ),
          ),
        ],
      ),
    );
  }

  DragTarget _targetArea(String key) {
    return DragTarget(
      builder: (context, income, rej) {
        if (gameScore[key] == true) {
          return Text("Correct", style: _style(Colors.green));
        }
        return SizedBox(
          width: 80,
          height: 80,
          child: ColoredBox(color: buzzlle[key]!),
        );
      },
      onWillAccept: (d) {
        return d == key;
      },
      onAccept: (d) {
        setState(() {
          gameScore[key] = true;
        });
      },
    );
  }

  Column _dragArea() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buzzlle.keys
          .map(
            (e) => Draggable(
              data: e,
              feedback: Text(
                e,
                style: _style(buzzlle[e]!),
              ),
              childWhenDragging: const SizedBox(),
              child: gameScore[e] == true
                  ? Text(
                      '✅',
                      style: _style(Colors.green),
                    )
                  : Text(
                      e,
                      style: _style(buzzlle[e]!),
                    ),
            ),
          )
          .toList(),
    );
  }

  TextStyle _style(Color color) {
    return TextStyle(
      color: color,
      fontSize: 25,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    );
  }
}
