import 'package:flutter/material.dart';

class ScoreViewer extends StatelessWidget {
  const ScoreViewer({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Text(score.toString(), style: TextStyle(
      fontSize: 30
    ),);
  }
}