import 'package:trivia_game/contexts/questions/question_model.dart';
import 'package:trivia_game/services/api_client.dart';

class QuestionRepository {
  ApiClient apiClient = ApiClient();

  Future<List<QuestionModel>> fetchQuestions({required categoryId}) async {
    final response = await apiClient.getAll(
      '/api.php',
      {
        'amount': 10,
        'category': categoryId,
      },
    );

    return (response?.data['results'] as List)
        .map((question) => QuestionModel.fromJson(question))
        .toList();
  }
}
