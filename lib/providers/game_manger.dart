import 'dart:math';
import 'package:flutter/material.dart';

enum GameStatus { ready, running, stopped }

class GameManager extends ChangeNotifier {
  int _score = 0;
  int _life = 3;
  int _currentSuccessMilli = 2000;
  int _targetTime = 0;
  int _userGuessInMilli = 0;
  GameStatus _currentState = GameStatus.ready;

  int getLife() => _life;
  int getScore() => _score;
  int getCurrentSuccessMilli() => _currentSuccessMilli;
  int getUserGuessInMilli() => _userGuessInMilli;
  GameStatus getCurrentState() => _currentState;

  GameManager() {
    setRandomTarget();
  }

  void resetStatus() {
    _score = 0;
    _life = 3;
    _currentSuccessMilli = 2000;
    _userGuessInMilli = 0;
    _currentState = GameStatus.ready;

    setRandomTarget();
    notifyListeners();
  }

  void handleSuccess() {
    _score++;
    _currentSuccessMilli = (_currentSuccessMilli * 8 / 10).toInt();

    notifyListeners();
  }

  void handleFail() {
    _life--;

    notifyListeners();
  }

  bool isGuessSucceed(DateTime startTime, DateTime endTime) {
    _userGuessInMilli = (endTime.difference(startTime)).abs().inMilliseconds;
    return (_userGuessInMilli - _targetTime * 1000).abs() <=
        _currentSuccessMilli;
  }

  bool isGameOver() {
    return _life == 0;
  }

  void setRandomTarget() {
    _targetTime = Random().nextInt(3) + 3;
    notifyListeners();
  }

  int getCurrentTarget() => _targetTime;

  void setGameState(GameStatus val) {
    _currentState = val;
    notifyListeners();
  }
}
