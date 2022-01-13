import 'package:trivia_game/contexts/questions/question_model.dart';
import 'package:trivia_game/services/api_client.dart';

class QuestionRepository {
  ApiClient apiClient = ApiClient();

  Future<QuestionModel> fetchQuestion() async {
    // final response = await apiClient.getAll('/api.php', {'amount': 1});

    // QuestionModel question =
    //     QuestionModel.fromJson(response?.data['results'][0]);

    return QuestionModel(
      question:
          'Which of the following is not a playable race in the MMORPG Guild Wars 2? ',
      category: 'Entertainment: Video Games',
      type: 'multiple',
      difficulty: 'medium',
      correctAnswer: 'Tengu',
      incorrectAnswers: ['Sylvari', 'Charr', 'Asura '],
    );
  }
}
