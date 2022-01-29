import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/category/category_screen.dart';
import 'package:trivia_game/contexts/questions/question_screen.dart';

void main() {
  runApp(const TriviaGame());
}

class TriviaGame extends StatelessWidget {
  const TriviaGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CategoryScreen(),
      },
      onGenerateRoute: (route) {
        if (route.name == '/question') {
          final args = route.arguments as Map;

          return MaterialPageRoute(
            builder: (context) {
              return QuestionScreen(categoryId: args['categoryId']);
            },
          );
        }
      },
    );
  }
}
