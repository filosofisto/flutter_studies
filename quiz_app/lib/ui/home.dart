import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List _questionBank = [
    Question.build(
        "The U.S. Declaration of Independency was adopted in 1776.", true),
    Question.build("The Supreme law of the land is Constitution.", true),
    Question.build(
        "The two rights in the Declaration of Independency are:"
        "\n Life "
        "\n Pursuit of happiness.",
        true),
    Question.build("The U.S. Constitution has 26 Amendments.", false),
    Question.build(
        "Freedom of religion means:\nYou can practice any religion, "
        "or not practice a religion.",
        true),
    Question.build(
        "Journalist is one branch or part of the government.", false),
    Question.build("The Congress does not make federal laws.", false),
    Question.build("There are 100 U.S. Senators.", true),
    Question.build("We elect a U.S. Senator for 4 years.", false),
    Question.build("We vote for president in January.", false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Image.asset(
                "images/flag.png",
                width: 250,
                height: 180,
              )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _questionBank[_currentQuestionIndex].questionText,
                      style: TextStyle(fontSize: 16.9, color: Colors.white),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    String message;
    Color color;

    if (userChoice == _questionBank[_currentQuestionIndex].isCorrect) {
      message = "Correct :)";
      color = Colors.green;
    } else {
      message = "Incorrect :(";
      color = Colors.red;
    }

    final snackbar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex =
          (_currentQuestionIndex + 1) % _questionBank.length;
    });
  }
}
