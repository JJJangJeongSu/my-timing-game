import 'package:flutter/material.dart';

class RandomTimeViewer extends StatelessWidget {
  const RandomTimeViewer({super.key, required this.targetTime});

  final int targetTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$targetTime초", style: TextStyle(fontSize: 50)),
            Text("에"),
          ],
        ),
        Text("멈추세요")
      ],
    );
  }
}
