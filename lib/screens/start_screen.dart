import 'package:flutter/material.dart';
import 'package:myapp/screens/game_screen/game_screen.dart';

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
            Text("시간 감각 테스트", style: TextStyle(fontSize: 40)),
            Text("당신의 감을 테스트 해보세요"),
            Container(height: 70),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => GameScreen()));
              },
              child: Text("게임 시작", style: TextStyle(fontSize: 20)),
            ),
            Container(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => GameScreen()));
              },
              child: Text("통계 보기", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
