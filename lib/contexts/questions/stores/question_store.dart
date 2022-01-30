import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/question_model.dart';
import 'package:trivia_game/contexts/questions/question_repository.dart';

class QuestionStore extends ChangeNotifier {
  static QuestionStore instance = QuestionStore();

  final QuestionRepository _repository = QuestionRepository();
  late List<QuestionModel> questions;

  Future<void> fetchQuestions({required categoryId}) async {
    questions = await _repository.fetchQuestions(categoryId: categoryId);

    notifyListeners();
  }
}
