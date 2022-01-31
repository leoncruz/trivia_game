import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/question_controller.dart';
import 'package:trivia_game/contexts/questions/stores/question_store.dart';
import 'package:trivia_game/contexts/questions/widgets/alternatives_widget.dart';

class Body extends StatelessWidget {
  final String questionTitle;
  final List<String> alternatives;

  final QuestionController _controller = QuestionController.instance;
  final QuestionStore _store = QuestionStore.instance;

  Body({
    Key? key,
    required this.questionTitle,
    required this.alternatives,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            questionTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          AlternativesWidget(alternatives),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              _controller.compareAlternatives();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_store.isRightAnswer ? 'Certo!' : 'Errado!'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: const Text(
              "Confirmar",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
