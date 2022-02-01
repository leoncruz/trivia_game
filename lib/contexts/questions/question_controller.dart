import 'package:trivia_game/contexts/questions/question_model.dart';
import 'package:trivia_game/contexts/questions/question_repository.dart';
import 'package:trivia_game/contexts/questions/stores/alternative_store.dart';
import 'package:trivia_game/contexts/questions/stores/question_store.dart';

class QuestionController {
  final QuestionStore _store = QuestionStore.instance;
  final AlternativeStore _alternativeStore = AlternativeStore.instance;
  final QuestionRepository _repository = QuestionRepository();
  final int quantity = 5;
  int index = 0;

  static QuestionController instance = QuestionController();

  QuestionModel get actualQuestion => _store.actualQuestion;

  changeQuestion() {
    index++;

    if (index < quantity) {
      _store.changeQuestion(index);
    } else {
      _store.endQuestions();
    }
    _alternativeStore.clear();
  }

  bool compareAlternatives() {
    final result =
        _alternativeStore.alternative == actualQuestion.correctAnswer;
    _store.rightAnswer(result);
    return result;
  }

  Future<void> fetchQuestions({required categoryId}) async {
    final questions = await _repository.fetchQuestions(
      categoryId: categoryId,
      quantity: quantity,
    );

    _store.addQuestions(questions);
  }
}
