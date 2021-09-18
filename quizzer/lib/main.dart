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

  List<Widget> score = [];

  List<Question> questions = [
    Question('Pedro Alvarez Cabral discovered Brazil', true),
    Question('Java is an amazing computer language', true),
    Question('C++ generate binary code that is slow', false),
    Question('Dart is not a Object Oriented language', false),
    Question('Java has more than 20 years of age', true)
  ];

  int currentIndex = 0;
  int correctAnswers = 0;

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
              questionTextOrResult(),
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
                        processAnswer(true);
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
                      processAnswer(false);
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
          children: score,
        )
      ],
    );
  }

  String questionTextOrResult() {
    if (currentIndex < questions.length) {
      return questions[currentIndex].text;
    }

    int perc = result();

    if (perc > 50) return 'Congrats, you got $perc%';

    return 'Sorry :(, you got only $perc%';
  }

  int result() {
    return (correctAnswers / questions.length * 100).round();
  }

  void processAnswer(bool value) {
    if (questions[currentIndex].correct == value) {
      score.add(Icon(Icons.check, color: Colors.green,));
      correctAnswers++;
    } else {
      score.add(Icon(Icons.close, color: Colors.red,));
    }

    currentIndex++;
  }
}
