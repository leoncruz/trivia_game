import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/stores/alternative_store.dart';
import 'package:trivia_game/contexts/questions/stores/question_store.dart';
import 'package:trivia_game/contexts/questions/widgets/alternatives_widget.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final QuestionStore _store = QuestionStore();
  final AlternativeStore _alternativeStore = AlternativeStore();

  @override
  void initState() {
    super.initState();
    _store.fetchQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _store,
      builder: (_, store, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                _store.value.question,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              AlternativesWidget(_store.value.alternatives),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_alternativeStore.value!),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text(
                  "Confirmar",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
