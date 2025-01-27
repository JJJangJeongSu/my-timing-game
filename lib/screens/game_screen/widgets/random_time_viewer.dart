import 'package:flutter/material.dart';

class RandomTimeViewer extends StatelessWidget {
  const RandomTimeViewer({super.key, required this.targetTime});

  final int targetTime;

  @override
  Widget build(BuildContext context) {
    return Text("$targetTime초", style: TextStyle(fontSize: 40));
  }
}
