// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) {
  List<dynamic> answers = json['incorrect_answers'];
  answers.add(json['correct_answer']);
  answers.shuffle();

  return QuizModel(
    category: json['category'] as String,
    type: json['type'] as String,
    difficulty: json['difficulty'] as String,
    question: json['question'] as String,
    correctAnswer: json['correct_answer'] as String,
    incorrectAnswers: answers
        .map((e) => convertHTMLToDart(e))
        .toList(),
  );
}

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'category': instance.category,
      'type': instance.type,
      'difficulty': instance.difficulty,
      'question': instance.question,
      'correct_answer': instance.correctAnswer,
      'incorrect_answers': instance.incorrectAnswers,
    };
