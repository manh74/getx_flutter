import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_quiz_app_getx/controllers/quiz_controller.dart';

class CurrentQuestionTitle extends StatelessWidget {
  const CurrentQuestionTitle({
    Key? key,
    required this.quizController,
  }) : super(key: key);

  final QuizController quizController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Obx(
          () => Text(
            quizController.questionTitle,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
