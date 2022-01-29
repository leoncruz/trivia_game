import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/category/category_model.dart';
import 'package:trivia_game/contexts/category/category_repository.dart';

class CategoryStore extends ChangeNotifier {
  final CategoryRepository _repository = CategoryRepository();

  List<CategoryModel> categories = [];

  Future<void> fillCategories() async {
    final List<CategoryModel> response = await _repository.fetchCategories();

    categories = response;

    notifyListeners();
  }
}
