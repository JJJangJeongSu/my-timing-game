import 'package:flutter/material.dart';

class LifeViewer extends StatelessWidget {
  const LifeViewer({super.key, required this.currentLife});
  final int currentLife;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          currentLife,
          (index) => HeartIcon(active: true),
        ),
        ...List.generate(
          3 - currentLife,
          (index) => HeartIcon(active: false),
        ),
      ],
    );
  }
}

class HeartIcon extends StatelessWidget {
  const HeartIcon({super.key, required this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      color: active
          ? Color.fromARGB(255, 238, 36, 21)
          : Color.fromARGB(255, 103, 103, 103),
      size: 40,
    );
  }
}
