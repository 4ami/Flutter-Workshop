import 'package:day2/drag_drop_game/util/data.dart';
import 'package:day2/drag_drop_game/util/draggable.dart';
import 'package:flutter/material.dart';

class DragDropGame extends StatefulWidget {
  const DragDropGame({super.key});

  @override
  State<DragDropGame> createState() => _DragDropGameState();
}

class _DragDropGameState extends State<DragDropGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3278A1).withOpacity(.5),
      appBar: AppBar(
        backgroundColor: const Color(0xff3278A1).withOpacity(.01),
        title: Text(
          'Score: ${score.length} / 3',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: buzzell.keys
                  .map((e) => Draggable<String>(
                        feedback: Image.asset(e, width: 150),
                        data: e,
                        childWhenDragging: const SizedBox(),
                        child: score[e] == true
                            ? const Text(
                                '✅',
                                style: TextStyle(fontSize: 35),
                              )
                            : DraggableLogo(logo: e),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: buzzell.keys
                .map(
                  (e) => _buildTarget(e),
                )
                .toList()
              ..shuffle(),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          setState(() {
            score.clear();
          });
        },
        child: const Icon(Icons.restart_alt, color: Colors.white),
      ),
    );
  }

  Widget _buildTarget(String logo) {
    return DragTarget(
      builder: (_, income, rej) {
        if (score[logo] == true) {
          return const Text(
            'Correct',
            style: TextStyle(
              fontSize: 35,
              color: Colors.greenAccent,
            ),
          );
        } else {
          return Text(
            textAlign: TextAlign.start,
            buzzell[logo]!,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          );
        }
      },
      onWillAccept: (d) => d == logo,
      onAccept: (d) {
        setState(() {
          score[logo] = true;
        });
      },
      onLeave: (d) {},
    );
  }
}
