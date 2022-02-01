import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/question_controller.dart';
import 'package:trivia_game/contexts/questions/stores/alternative_store.dart';
import 'package:trivia_game/contexts/questions/stores/question_store.dart';
import 'package:trivia_game/contexts/questions/widgets/alternatives_widget.dart';

class Body extends StatelessWidget {
  final String questionTitle;
  final List<String> alternatives;

  final QuestionController _controller = QuestionController.instance;
  final QuestionStore _store = QuestionStore.instance;
  final AlternativeStore _alternativeStore = AlternativeStore.instance;

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
          AnimatedBuilder(
            animation: _alternativeStore,
            builder: (BuildContext context, _) {
              return submitButtom(context);
            },
          ),
        ],
      ),
    );
  }

  Widget submitButtom(BuildContext context) {
    const buttonText = Text(
      "Confirmar",
      style: TextStyle(
        fontSize: 18,
      ),
    );

    if (_alternativeStore.alternative == '') {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          primary: Colors.grey,
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: () {},
        child: buttonText,
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        primary: Colors.blue,
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
      child: buttonText,
    );
  }
}
