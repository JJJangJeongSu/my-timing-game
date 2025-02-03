import 'package:flutter/material.dart';
import 'package:myapp/screens/game_screen/utilities/game_manager.dart';

class TimerButton extends StatelessWidget {
  const TimerButton(
      {super.key, required this.gameStatus, required this.onClick});
  final GameStatus gameStatus;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(50),
        textStyle: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(fontWeight: FontWeight.normal),
        shape: CircleBorder(),
      ),
      child: Text(
        gameStatus == GameStatus.ready
            ? "Start"
            : (gameStatus == GameStatus.running ? "Stop" : "Next"),
      ),
    );
  }
}
