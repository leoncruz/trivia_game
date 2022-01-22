import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/stores/alternative_store.dart';

class AlternativesWidget extends StatelessWidget {
  final AlternativeStore _alternativeStore = AlternativeStore.instance;

  List<String> alternatives;

  AlternativesWidget(this.alternatives, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _alternativeStore,
      builder: (BuildContext context, Widget? child) {
        return Expanded(
          child: ListView.builder(
            itemCount: alternatives.length,
            itemBuilder: (_, index) {
              return RadioListTile(
                title: Text(alternatives[index]),
                value: alternatives[index],
                groupValue: _alternativeStore.alternative,
                onChanged: (String? selected) {
                  _alternativeStore.selectAlternative(selected);
                },
              );
            },
          ),
        );
      },
    );
  }
}
