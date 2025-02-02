import 'package:flutter/material.dart';
import 'package:myapp/screens/game_screen/game_screen.dart';
import 'package:myapp/screens/start_screen/themed_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "시간 감각 테스트",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "당신의 감을 테스트 해보세요",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 20,
              ),
            ),
            Container(height: 80),
            ThemedButton(
              content: "게임 시작",
              screen: GameScreen(),
              context: context,
            ),
            Container(height: 20),
            ThemedButton(
              content: "통계 보기",
              screen: GameScreen(),
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
