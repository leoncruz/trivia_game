import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/question_model.dart';

class QuestionStore extends ChangeNotifier {
  static QuestionStore instance = QuestionStore();

  late List<QuestionModel> questions;
  bool isEndQuestions = false;
  bool isRightAnswer = false;
  int index = 0;
  int points = 0;

  QuestionModel get actualQuestion => questions[index];

  changeQuestion(int newIndex) {
    index = newIndex;

    notifyListeners();
  }

  addQuestions(List<QuestionModel> newQuestions) {
    questions = newQuestions;

    notifyListeners();
  }

  endQuestions() {
    isEndQuestions = true;

    notifyListeners();
  }

  rightAnswer(value) {
    isRightAnswer = value;

    notifyListeners();
  }

  addPoint() {
    points++;
  }
}
