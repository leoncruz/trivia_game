import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia_game/contexts/category/category_model.dart';
import 'package:trivia_game/contexts/category/category_repository.dart';
import 'package:trivia_game/contexts/category/category_screen.dart';

import 'category_screen_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  MockCategoryRepository categoryRepositoryMock = MockCategoryRepository();

  final screen = MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      home: CategoryScreen(),
    ),
  );

  group('CategoryScreen', () {
    setUp(() {
      when(categoryRepositoryMock.fetchCategories()).thenAnswer(
        (_) async => [
          CategoryModel(id: 1, name: 'Livros'),
          CategoryModel(id: 1, name: 'Jogos'),
          CategoryModel(id: 1, name: 'Conhecimentos Gerais'),
        ],
      );
    });

    group('when a request is running', () {
      testWidgets('has to show a loading spinner', (tester) async {
        await tester.pumpWidget(screen);
        await tester.pumpAndSettle();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });

    group('when a request is complete without error', () {
      testWidgets('has to show categories on screen', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(screen);
        });

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });
  });
}
