import 'package:trivia_game/contexts/questions/question_model.dart';
import 'package:trivia_game/services/api_client.dart';

class QuestionRepository {
  ApiClient apiClient = ApiClient();

  Future<QuestionModel> fetchQuestion({required categoryId}) async {
    final response = await apiClient.getAll(
      '/api.php',
      {
        'amount': 1,
        'category': categoryId,
      },
    );

    return QuestionModel.fromJson(response?.data['results'][0]);
  }
}
