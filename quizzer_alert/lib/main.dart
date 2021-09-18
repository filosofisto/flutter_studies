import 'package:flutter/material.dart';
import 'package:quizzer_alert/question.dart';
import 'package:quizzer_alert/question_engine.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  QuestionEngine _questionEngine = QuestionEngine();
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
                        _processAnswer(true, context);
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
                      _processAnswer(false, context);
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
    if (!_questionEngine.finished()) {
      return _questionEngine.current().text;
    }

    int perc = _result();
    return _textResult(perc);
  }

  int _result() {
    return (_correctAnswers / _questionEngine.quantityQuestions() * 100)
        .round();
  }

  String _textResult(int perc) {
    if (perc > 50) return 'Congrats, you got $perc%';

    return 'Sorry :(, you got only $perc%';
  }

  void _processAnswer(bool value, BuildContext context) {
    if (_questionEngine.current().correct == value) {
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

    _questionEngine.next();

    if (_questionEngine.finished()) {
      int perc = _result();

      Alert(
          context: context,
          title: 'Finished!',
          desc: _textResult(perc),
          buttons: [
            DialogButton(
                child: Text(
                  'Ok',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () => Navigator.pop(context))
          ]
          // alertAnimation: _fadeAlertAnimation
          ).show();

      _questionEngine.reset();
      _score = [];
      _correctAnswers = 0;
    }
  }

// Widget _fadeAlertAnimation(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//     ) {
//   return Align(
//     child: FadeTransition(
//       opacity: animation,
//       child: child,
//     ),
//   );
// }
}
