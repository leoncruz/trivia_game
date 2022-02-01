import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/stores/question_store.dart';

class AnswerScreen extends StatefulWidget {
  final bool isRightAnswer;

  const AnswerScreen({Key? key, required this.isRightAnswer}) : super(key: key);

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen>
    with TickerProviderStateMixin {
  final QuestionStore _questionStore = QuestionStore.instance;

  late Timer timer;
  late AnimationController _animationController;
  int _time = 3;
  late Color iconColor, progressMainColor, progressBackgroundColor;
  late String message;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_time > 0) {
          _time--;
        }
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (!_questionStore.isEndQuestions) {
        Navigator.pop(context);
      } else {
        Navigator.pushNamed(context, '/end_game');
      }
    });

    iconColor = widget.isRightAnswer ? Colors.green : Colors.red;
    progressMainColor = widget.isRightAnswer ? Colors.green : Colors.red;
    progressBackgroundColor =
        widget.isRightAnswer ? Colors.green.shade100 : Colors.red.shade100;
    message = widget.isRightAnswer ? 'Resposta Certa!' : 'Resposta Errada!';
  }

  @override
  void dispose() {
    _animationController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.check_circle,
              color: iconColor,
              size: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Text(
                "Próxima pergunta em: $_time",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: LinearProgressIndicator(
                color: progressMainColor,
                backgroundColor: progressBackgroundColor,
                value: _animationController.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
