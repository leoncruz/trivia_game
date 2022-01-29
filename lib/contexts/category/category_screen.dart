import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/category/stores/category_store.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryStore _categoryStore = CategoryStore();

  @override
  void initState() {
    super.initState();

    _categoryStore.fillCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _categoryStore,
        builder: (BuildContext context, Widget? child) {
          return GridView.count(
            crossAxisCount: 3,
            children: List.generate(
              _categoryStore.categories.length,
              (index) {
                return ListTile(
                  title: Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        _categoryStore.categories[index].formattedName ?? '',
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
        },
      ),
    );
  }
}
