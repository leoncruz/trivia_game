import 'package:flutter/material.dart';

import 'stores/category_store.dart';
import 'widgets/body.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _categoryStore = CategoryStore();
  late Future<void> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = _categoryStore.fillCategories();
  }

  @override
  void dispose() {
    super.dispose();
    _categoryStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureCategories,
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
