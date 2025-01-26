import 'package:flutter/material.dart';
import 'package:myapp/screens/game_screen/widgets/life_viewer.dart';
import 'package:myapp/screens/game_screen/widgets/result_viewer.dart';
import 'package:myapp/screens/game_screen/widgets/score_viewer.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.home),
        ),
        actions: [ScoreViewer()],
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LifeViewer(),
            Text("5초", style: TextStyle(fontSize: 30)),
            ResultViewer(),
            ElevatedButton(onPressed: () {}, child: Text("시작")),
          ],
        ),
      ),
    );
  }
}
