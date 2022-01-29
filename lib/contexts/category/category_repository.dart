import 'package:trivia_game/contexts/category/category_model.dart';
import 'package:trivia_game/services/api_client.dart';

class CategoryRepository {
  final ApiClient _client = ApiClient();

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await _client.getAll('/api_category.php', {});

    return (response?.data['trivia_categories'] as List)
        .map((category) => CategoryModel.fromJson(category))
        .toList();
  }
}
