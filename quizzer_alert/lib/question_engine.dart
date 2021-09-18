
import 'package:quizzer_alert/question.dart';

class QuestionEngine {

  List<Question> _questions = [
    Question('Pedro Alvarez Cabral discovered Brazil', true),
    Question('Java is an amazing computer language', true),
    Question('C++ generate binary code that is slow', false),
    Question('Dart is not a Object Oriented language', false),
    Question('Java has more than 20 years of age', true)
  ];

  int _currentIndex = 0;

  void next() {
    ++_currentIndex;
  }

  Question current() {
    return _questions[_currentIndex];
  }

  bool finished() {
    return _currentIndex >= _questions.length;
  }

  int quantityQuestions() {
    return _questions.length;
  }

  void reset() {
    _currentIndex = 0;
  }
}