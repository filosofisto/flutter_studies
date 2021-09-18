import 'package:flutter/material.dart';
import 'package:quizzer/question.dart';

void main() {
  runApp(Quizzer());
}

class Quizzer extends StatelessWidget {
  const Quizzer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: QuizzPage(),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Widget> _score = [];

  List<Question> _questions = [
    Question('Pedro Alvarez Cabral discovered Brazil', true),
    Question('Java is an amazing computer language', true),
    Question('C++ generate binary code that is slow', false),
    Question('Dart is not a Object Oriented language', false),
    Question('Java has more than 20 years of age', true)
  ];

  int _currentIndex = 0;
  int _correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              _questionTextOrResult(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.green,
                            Colors.lightGreenAccent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        _processAnswer(true);
                      });
                    },
                    child:
                        Align(alignment: Alignment.center, child: Text('True')),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Colors.red,
                          Colors.redAccent,
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      _processAnswer(false);
                    });
                  },
                  child: Align(
                      alignment: Alignment.center, child: const Text('False')),
                ),
              ],
            ),
          ),
        )),
        Row(
          children: _score,
        )
      ],
    );
  }

  String _questionTextOrResult() {
    if (_currentIndex < _questions.length) {
      return _questions[_currentIndex].text;
    }

    int perc = _result();

    if (perc > 50) return 'Congrats, you got $perc%';

    return 'Sorry :(, you got only $perc%';
  }

  int _result() {
    return (_correctAnswers / _questions.length * 100).round();
  }

  void _processAnswer(bool value) {
    if (_currentIndex >= _questions.length) {
      return;
    }

    if (_questions[_currentIndex].correct == value) {
      _score.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      _correctAnswers++;
    } else {
      _score.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }

    _currentIndex++;
  }
}
