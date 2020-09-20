class _Quiz {
  String _text;
  bool _answer;

  _Quiz({String text, bool answer}) {
    this._text = text;
    this._answer = answer;
  }

  String get text => this._text;
  bool get answer => this._answer;
  bool isCorrect(bool pickedAnswer) => this._answer == pickedAnswer;
}

class QuizBank {
  int _quizNumber = 0;
  List<_Quiz> _quizBank = [
    _Quiz(text: 'Some cats are actually allergic to humans', answer: true),
    _Quiz(
        text: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    _Quiz(
        text: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    _Quiz(text: 'A slug\'s blood is green.', answer: true),
    _Quiz(
        text: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answer: true),
    _Quiz(text: 'It is illegal to pee in the Ocean in Portugal.', answer: true),
    _Quiz(
        text:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answer: false),
    _Quiz(
        text:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true),
    _Quiz(
        text:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answer: false),
    _Quiz(
        text:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answer: true),
    _Quiz(text: 'Google was originally called \"Backrub\".', answer: true),
    _Quiz(
        text:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answer: true),
    _Quiz(
        text:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answer: true),
  ];

  String get text => this._quizBank[this._quizNumber].text;
  bool get answer => this._quizBank[this._quizNumber].answer;

  void reset() {
    this._quizNumber = 0;
  }

  bool next() {
    if (this._quizNumber < this._quizBank.length - 1) {
      this._quizNumber++;
      return true;
    } else {
      return false;
    }
  }

  bool isCorrect(bool pickedAnswer) =>
      this._quizBank[this._quizNumber].isCorrect(pickedAnswer);
}
