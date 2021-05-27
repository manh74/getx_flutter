import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_quiz_app_getx/utils/convert_html_to_dart.dart';

part 'quiz.model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizModel {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  List<String> get questionOptions {
    final questions = [...incorrectAnswers];

    return questions;
  }

  String get displayQuestion {
    return convertHTMLToDart(question);
  }

  QuizModel(
      {required this.category,
      required this.type,
      required this.difficulty,
      required this.question,
      required this.correctAnswer,
      required this.incorrectAnswers});

  factory QuizModel.fromJson(Map<String, dynamic> data) =>
      _$QuizModelFromJson(data);

  Map<String, dynamic> toJson() => _$QuizModelToJson(this);

  static List<String> parseIncorrectAnswers(incorrectAnswersJson) {
    List<String> incorrectAnswersList = List<String>.from(incorrectAnswersJson);
    return incorrectAnswersList;
  }
}
