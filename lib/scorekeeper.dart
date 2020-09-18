import 'package:flutter/material.dart';

class ScoreKeeper {
  List<Icon> _score = [];

  List<Icon> get score => this._score;

  void addCorrect() {
    Icon correctIcon = Icon(
      Icons.check,
      color: Colors.lightGreenAccent,
    );
    _score.add(correctIcon);
  }

  void addIncorrect() {
    Icon incorrectIcon = Icon(
      Icons.cancel,
      color: Colors.red,
    );
    _score.add(incorrectIcon);
  }
}
