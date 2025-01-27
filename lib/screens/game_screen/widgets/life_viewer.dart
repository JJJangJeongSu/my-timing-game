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
          (index) => Icon(
            Icons.favorite,
            color: const Color.fromARGB(255, 238, 36, 21),
            size: 30,
          ),
        ),...List.generate(
          3-currentLife,
          (index) => Icon(
            Icons.favorite,
            color: const Color.fromARGB(255, 103, 103, 103),
            size: 30,
          ),
        ),
      ],
    );
  }
}
