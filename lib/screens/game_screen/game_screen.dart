import 'package:flutter/material.dart';
import 'package:myapp/screens/game_screen/utilities/game_manager.dart';
import 'package:myapp/screens/game_screen/widgets/life_viewer.dart';
import 'package:myapp/screens/game_screen/widgets/random_time_viewer.dart';
import 'package:myapp/screens/game_screen/widgets/guess_result_viewer.dart';
import 'package:myapp/screens/game_screen/widgets/result_dialog.dart';
import 'package:myapp/screens/game_screen/widgets/score_viewer.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool isRunning = false;
  bool isInitial = true;
  DateTime? startTime;
  DateTime? endTime;
  GameManager gameManager = GameManager();
  int score = 0;
  int currentTimeTarget = 0;

  void toggleButton() {
    setState(() {
      isRunning = !isRunning;
    });

    if (isRunning) {
      if (isInitial) isInitial = !isInitial;
      startTime = DateTime.now();
      gameManager.generateRandomTarget();
      setState(() {
        currentTimeTarget = gameManager.getCurrentTarget();
      });
    } else {
      endTime = DateTime.now();
      if (gameManager.isGuessSucceed(startTime!, endTime!)) {
        setState(() {
          gameManager.handleSuccess();
        });
      } else {
        setState(() {
          gameManager.handleFail();
        });
        if (gameManager.isGameOver()) {
          showResultScreen(gameManager);
        }
      }
    }
  }

  void showResultScreen(GameManager gameManager) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ResultDialog(gameManager: gameManager),
    );
  }

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
        actions: [ScoreViewer(score: gameManager.getScore())],
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LifeViewer(currentLife: gameManager.getLife()),
            if (!isInitial) RandomTimeViewer(targetTime: currentTimeTarget),
            if (!isRunning && !isInitial)
              GuessResultViewer(gameManager: gameManager),
            ElevatedButton(
              onPressed: toggleButton,
              child: Text(
                !isRunning ? "시작" : "끝",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
