import 'package:flutter/material.dart';
import 'package:myapp/providers/game_manger.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({
    super.key,
    required this.gameStatus,
    required this.onClick,
    required this.context,
  });
  final GameStatus gameStatus;
  final void Function(BuildContext) onClick;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClick(context),
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
