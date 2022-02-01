import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/question_controller.dart';
import 'package:trivia_game/contexts/questions/screens/end_game.dart';
import 'package:trivia_game/contexts/questions/stores/alternative_store.dart';
import 'package:trivia_game/contexts/questions/stores/question_store.dart';
import 'package:trivia_game/contexts/questions/widgets/body.dart';

class QuestionScreen extends StatefulWidget {
  final int categoryId;

  const QuestionScreen({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final QuestionStore _questionStore = QuestionStore.instance;
  final AlternativeStore _alternativeStore = AlternativeStore.instance;
  final QuestionController _controller = QuestionController.instance;

  @override
  void dispose() {
    _questionStore.isEndQuestions = false;
    _controller.index = 0;
    _questionStore.index = 0;
    _alternativeStore.alternative = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pergunta',
        ),
      ),
      body: FutureBuilder(
        future: _controller.fetchQuestions(categoryId: widget.categoryId),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AnimatedBuilder(
              animation: _questionStore,
              builder: (BuildContext context, Widget? child) {
                return Body(
                  questionTitle: _controller.actualQuestion.questionCommand,
                  alternatives: _controller.actualQuestion.alternatives,
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
