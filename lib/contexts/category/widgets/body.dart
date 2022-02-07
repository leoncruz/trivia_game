import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/category/category_model.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.categories}) : super(key: key);

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        categories.length,
        (index) {
          return ListTile(
            title: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/question',
                    arguments: {'categoryId': categories[index].id},
                  );
                },
                child: Text(
                  categories[index].formattedName ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
