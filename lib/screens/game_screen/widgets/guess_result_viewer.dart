import 'package:flutter/material.dart';
import 'package:myapp/providers/game_manger.dart';

class GuessResultViewer extends StatelessWidget {
  const GuessResultViewer({super.key, required this.gameManager});
  final GameManager gameManager;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("사용자의 예측: ${gameManager.getUserGuessInMilli() / 1000}"),
        Text(
            "차이: ${(gameManager.getUserGuessInMilli() / 1000 - gameManager.getCurrentTarget()).abs().toStringAsFixed(3)}"),
        Text(
            "허용 범위: ${(gameManager.getCurrentSuccessMilli() / 1000).toStringAsFixed(3)}"),
      ],
    );
  }
}
