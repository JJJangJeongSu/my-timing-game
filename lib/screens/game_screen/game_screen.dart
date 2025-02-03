import 'package:flutter/material.dart';
import 'package:myapp/providers/game_manger.dart';
import 'package:myapp/screens/game_screen/widgets/life_viewer.dart';
import 'package:myapp/screens/game_screen/widgets/random_time_viewer.dart';
import 'package:myapp/screens/game_screen/widgets/guess_result_viewer.dart';
import 'package:myapp/screens/game_screen/widgets/result_dialog.dart';
import 'package:myapp/screens/game_screen/widgets/timer_button.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  DateTime? startTime;
  DateTime? endTime;
  int score = 0;
  late Color currentBackgroundColor;

  Color getBackgroundColor(GameStatus status, BuildContext context) {
    switch (status) {
      case GameStatus.ready:
        return Theme.of(context).primaryColorLight;
      case GameStatus.running:
        return const Color.fromARGB(255, 236, 116, 116);
      case GameStatus.stopped:
        return Colors.greenAccent;
    }
  }

  void toggleButton(BuildContext context) {
    final GameManager gameManager = context.read<GameManager>();
    GameStatus currentStatus = gameManager.getCurrentState();

    if (currentStatus == GameStatus.ready) {
      // Start Timer
      startTime = DateTime.now();

      // Set State to 'running'
      gameManager.setGameState(GameStatus.running);
    } else if (currentStatus == GameStatus.running) {
      // Stop Timer
      endTime = DateTime.now();

      // Check Whether Success or Fail
      if (gameManager.isGuessSucceed(startTime!, endTime!)) {
        gameManager.handleSuccess();
      } else {
        gameManager.handleFail();
        if (gameManager.isGameOver()) {
          showResultScreen(gameManager, context);
        }
      }

      // Set State to 'stopped'
      gameManager.setGameState(GameStatus.stopped);
    } else if (currentStatus == GameStatus.stopped) {
      // Generate New Time & Display the content
      gameManager.setRandomTarget();

      // Set State to 'ready'
      gameManager.setGameState(GameStatus.ready);
    }
  }

  void showResultScreen(GameManager gameManager, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ResultDialog(gameManager: gameManager),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBackgroundColor(
          context.watch<GameManager>().getCurrentState(), context),
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.displaySmall,
        title: Padding(
          padding: EdgeInsets.only(),
          child: Text(
            "Score: ${context.watch<GameManager>().getScore()}",
          ),
        ),
        backgroundColor: getBackgroundColor(
            context.watch<GameManager>().getCurrentState(), context),
        leading: IconButton(
          onPressed: () {
            Provider.of<GameManager>(context, listen: false).resetStatus();
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
            Consumer<GameManager>(
              builder: (context, gameManger, child) => LifeViewer(
                currentLife: gameManger.getLife(),
              ),
            ),
            Consumer<GameManager>(
              builder: (context, gameManager, child) => RandomTimeViewer(
                targetTime: gameManager.getCurrentTarget(),
              ),
            ),
            Consumer<GameManager>(
              builder: (context, gameManager, child) => Visibility(
                visible: gameManager.getCurrentState() == GameStatus.stopped,
                child: GuessResultViewer(gameManager: gameManager),
              ),
            ),
            Consumer<GameManager>(
              builder: (context, gameManager, child) => TimerButton(
                  gameStatus: gameManager.getCurrentState(),
                  onClick: toggleButton,
                  context: context),
            ),
          ],
        ),
      ),
    );
  }
}
