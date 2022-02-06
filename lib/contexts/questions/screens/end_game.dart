import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/question_controller.dart';

class EndGame extends StatelessWidget {
  EndGame({Key? key}) : super(key: key);

  final controller = QuestionController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
            const SizedBox(height: 50),
            Text(
              'Pontos: ${controller.points}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                },
                child: const Text('Voltar para o Início',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
