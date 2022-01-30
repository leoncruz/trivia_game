import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/stores/alternative_store.dart';
import 'package:trivia_game/contexts/questions/stores/question_store.dart';
import 'package:trivia_game/contexts/questions/widgets/alternatives_widget.dart';

class QuestionScreen extends StatefulWidget {
  final int categoryId;

  const QuestionScreen({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final QuestionStore _questionStore = QuestionStore.instance;
  final AlternativeStore _alternativeStore = AlternativeStore.instance;

  @override
  void initState() {
    super.initState();
    _questionStore.fetchQuestions(categoryId: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pergunta',
        ),
      ),
      body: AnimatedBuilder(
        animation: _questionStore,
        builder: (BuildContext context, Widget? child) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  _questionStore.questions[0].question,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                AlternativesWidget(_questionStore.questions[0].alternatives),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(_alternativeStore.alternative!),
                        duration: const Duration(seconds: 1),
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
        },
      ),
    );
  }
}
