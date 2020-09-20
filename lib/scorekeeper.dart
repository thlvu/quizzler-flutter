import 'package:flutter/material.dart';

class ScoreKeeper {
  int _correctNum = 0;
  List<Icon> _score = [];

  List<Icon> get score => this._score;
  int get scoreNum => this._score.length;
  int get correctNum => this._correctNum;

  void reset() {
    this._score.clear();
    this._correctNum = 0;
  }

  void addCorrect() {
    Icon correctIcon = Icon(
      Icons.check,
      color: Colors.lightGreenAccent,
    );
    _score.add(correctIcon);
    _correctNum++;
  }

  void addIncorrect() {
    Icon incorrectIcon = Icon(
      Icons.cancel,
      color: Colors.red,
    );
    _score.add(incorrectIcon);
  }
}
