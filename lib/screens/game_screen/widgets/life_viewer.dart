import 'package:flutter/material.dart';

class LifeViewer extends StatelessWidget {
  const LifeViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Icon(Icons.favorite, color: Colors.red, size: 30),
      ),
    );
  }
}
