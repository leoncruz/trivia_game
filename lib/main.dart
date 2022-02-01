import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/category/category_screen.dart';
import 'package:trivia_game/contexts/questions/question_screen.dart';
import 'package:trivia_game/contexts/questions/screens/answer.dart';

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
        switch (route.name) {
          case '/question':
            final args = route.arguments as Map;

            return MaterialPageRoute(
              builder: (context) =>
                  QuestionScreen(categoryId: args['categoryId']),
            );
          case '/answer':
            final args = route.arguments as Map;

            return MaterialPageRoute(
              builder: (context) =>
                  AnswerScreen(isRightAnswer: args['isRightAnswer']),
            );
        }
      },
    );
  }
}
