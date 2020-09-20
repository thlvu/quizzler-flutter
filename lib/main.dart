import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbank.dart';
import 'scorekeeper.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBank quizBank = QuizBank();
  ScoreKeeper scoreKeeper = ScoreKeeper();

  void updateScore(bool pickedAnswer) {
    if (quizBank.isCorrect(pickedAnswer)) {
      scoreKeeper.addCorrect();
    } else {
      scoreKeeper.addIncorrect();
    }
  }

  bool nextQuiz() {
    return quizBank.next();
  }

  void reset() {
    quizBank.reset();
    scoreKeeper.reset();
  }

  void showButton() {
    Alert(
      context: context,
      type: AlertType.none,
      title: 'Finished!',
      desc:
          '  You\'ve reached the end of quiz. (Correct: ${scoreKeeper.correctNum}/${scoreKeeper.scoreNum})',
      buttons: [
        DialogButton(
          child: Text(
            'CANCEL',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 220,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                this.quizBank.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  updateScore(true);

                  bool isContinue = nextQuiz();

                  if (!isContinue) {
                    showButton();
                    reset();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  updateScore(false);

                  bool isContinue = nextQuiz();

                  if (!isContinue) {
                    showButton();
                    reset();
                  }
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: scoreKeeper.score,
        ),
      ],
    );
  }
}
