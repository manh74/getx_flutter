import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_quiz_app_getx/controllers/quiz_controller.dart';

class QuestionIndex extends StatelessWidget {
  const QuestionIndex({
    Key? key,
    required this.quizController,
  }) : super(key: key);

  final QuizController quizController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Question ${quizController.numberCurrentQuestion}",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white),
          ),
          Text(
            "/ ${quizController.quizLength}",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
