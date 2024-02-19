import 'package:day2/drag_drop_game/main/game.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MultiViewApp());

class MultiViewApp extends StatelessWidget {
  const MultiViewApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const DragDropGame(),
    );
  }
}
