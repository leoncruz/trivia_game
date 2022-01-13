import 'package:flutter/material.dart';
import 'package:trivia_game/contexts/questions/stores/alternative_store.dart';

class AlternativesWidget extends StatelessWidget {
  final AlternativeStore _alternativeStore = AlternativeStore();
  List<String> alternatives;

  AlternativesWidget(this.alternatives, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _alternativeStore,
      builder: (_, state, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: alternatives.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(alternatives[index]),
                leading: Radio(
                  value: alternatives[index],
                  groupValue: _alternativeStore.value,
                  onChanged: (String? alternative) {
                    _alternativeStore.selectAlternative(alternative);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
