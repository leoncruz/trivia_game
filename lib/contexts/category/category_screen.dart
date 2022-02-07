import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/category/stores/category_store.dart';
import 'package:trivia_game/contexts/category/widgets/body.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  final _categoryStore = CategoryStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _categoryStore.fillCategories(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Body(categories: _categoryStore.categories);
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
