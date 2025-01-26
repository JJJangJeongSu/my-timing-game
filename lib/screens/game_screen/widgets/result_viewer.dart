import 'package:flutter/material.dart';

class ResultViewer extends StatelessWidget {
  const ResultViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text("사용자의 예측: "), Text("차이: "), Text("허용 범위")],
    );
  }
}
