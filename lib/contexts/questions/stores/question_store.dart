import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/question_model.dart';
import 'package:trivia_game/contexts/questions/question_repository.dart';

class QuestionStore extends ValueNotifier<QuestionModel> {
  final QuestionRepository _repository = QuestionRepository();

  QuestionStore() : super(QuestionModel());

  Future<void> fetchQuestion() async {
    final QuestionModel question = await _repository.fetchQuestion();
    value = question;
  }
}