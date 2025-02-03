import 'package:flutter/material.dart';
import 'package:myapp/screens/game_screen/utilities/game_manager.dart';
import 'package:myapp/screens/game_screen/widgets/life_viewer.dart';
import 'package:myapp/screens/game_screen/widgets/random_time_viewer.dart';
import 'package:myapp/screens/game_screen/widgets/guess_result_viewer.dart';
import 'package:myapp/screens/game_screen/widgets/result_dialog.dart';
import 'package:myapp/screens/game_screen/widgets/timer_button.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  DateTime? startTime;
  DateTime? endTime;
  GameManager gameManager = GameManager();
  int score = 0;
  int currentTimeTarget = 0;
  late Color currentBackgroundColor;

  Color getBackgroundColor(GameStatus status) {
    switch (status) {
      case GameStatus.ready:
        return Theme.of(context).primaryColorLight;
      case GameStatus.running:
        return const Color.fromARGB(255, 236, 116, 116);
      case GameStatus.stopped:
        return Colors.greenAccent;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentBackgroundColor =
        Theme.of(context).primaryColorLight; // 여기서 `Theme.of(context)` 사용
  }

  @override
  void initState() {
    super.initState();
    gameManager.generateRandomTarget();
    currentTimeTarget = gameManager.getCurrentTarget();
  }

  void toggleButton() {
    GameStatus currentStatus = gameManager.getCurrentState();

    if (currentStatus == GameStatus.ready) {
      // Start Timer
      startTime = DateTime.now();

      // Set State to 'running'
      setState(() {
        gameManager.setGameState(GameStatus.running);
      });
    } else if (currentStatus == GameStatus.running) {
      // Stop Timer
      endTime = DateTime.now();

      // Check Whether Success or Fail
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

      // Set State to 'stopped'
      setState(() {
        gameManager.setGameState(GameStatus.stopped);
      });
    } else if (currentStatus == GameStatus.stopped) {
      // Generate New Time & Display the content
      gameManager.generateRandomTarget();
      setState(() {
        currentTimeTarget = gameManager.getCurrentTarget();
      });

      // Set State to 'ready'
      setState(() {
        gameManager.setGameState(GameStatus.ready);
      });
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
      backgroundColor: getBackgroundColor(gameManager.getCurrentState()),
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.displaySmall,
        title: Padding(
          padding: EdgeInsets.only(),
          child: Text(
            "Score: ${gameManager.getScore()}",
          ),
        ),
        backgroundColor: getBackgroundColor(gameManager.getCurrentState()),
        leading: IconButton(
          onPressed: () {
            setState(() {
              gameManager.resetStatus();
            });
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.home,
            size: 35,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LifeViewer(currentLife: gameManager.getLife()),
            RandomTimeViewer(targetTime: currentTimeTarget),
            Visibility(
              visible: gameManager.getCurrentState() == GameStatus.stopped,
              child: GuessResultViewer(gameManager: gameManager),
            ),
            TimerButton(
              gameStatus: gameManager.getCurrentState(),
              onClick: toggleButton,
            ),
          ],
        ),
      ),
    );
  }
}
