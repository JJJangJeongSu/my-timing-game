import 'dart:math';

class GameManager {
  int score = 0;
  int life = 3;
  int currentSuccessMilli = 2000;
  int targetTime = 0;
  int userGuessInMilli = 0;

  int getLife() => life;
  int getScore() => score;
  int getCurrentSuccessMilli() => currentSuccessMilli;
  int getUserGuessInMilli() => userGuessInMilli;

  void resetStatus() {
    score = 0;
    life = 3;
    currentSuccessMilli = 0;
    targetTime = 0;
    userGuessInMilli = 0;
  }

  void handleSuccess() {
    score++;
    currentSuccessMilli = (currentSuccessMilli * 7 / 10).toInt();
  }

  void handleFail() {
    life--;
  }

  bool isGuessSucceed(DateTime startTime, DateTime endTime) {
    userGuessInMilli = (endTime.difference(startTime)).abs().inMilliseconds;
    return (userGuessInMilli-targetTime*1000).abs() <=
        currentSuccessMilli;
  }

  bool isGameOver() {
    return life == 0;
  }

  void generateRandomTarget() {
    targetTime = Random().nextInt(3) + 3;
  }

  int getCurrentTarget() => targetTime;
}
