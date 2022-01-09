import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/question_page.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Trivia Game'),
        ),
        body: const QuestionPage(),
      ),
    );
  }
}
