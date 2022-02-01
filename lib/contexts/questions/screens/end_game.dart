import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/stores/question_store.dart';

class EndGame extends StatelessWidget {
  EndGame({Key? key}) : super(key: key);

  final QuestionStore _questionStore = QuestionStore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Fim de jogo',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            Text(
              'Pontos: ${_questionStore.points}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Início'),
            ),
          ],
        ),
      ),
    );
  }
}
