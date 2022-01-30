import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  final String category, type, difficulty, question;

  @JsonKey(name: 'correct_answer')
  final String correctAnswer;

  @JsonKey(name: 'incorrect_answers')
  final List<String> incorrectAnswers;

  @JsonKey(ignore: true)
  late List<String> alternatives;

  QuestionModel({
    this.category = '',
    this.type = '',
    this.difficulty = '',
    this.question = '',
    this.correctAnswer = '',
    this.incorrectAnswers = const [''],
  }) {
    alternatives = setAlternatives();
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  List<String> setAlternatives() {
    List<String> options = [correctAnswer] + incorrectAnswers;
    options.shuffle();

    return options;
  }

  String get questionCommand {
    String formatted = question.replaceAll("&quot;", '"');
    formatted = formatted.replaceAll("&eacute;", "é");

    return formatted.replaceAll("&#039;", "'");
  }
}
