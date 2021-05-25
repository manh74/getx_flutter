import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_quiz_app_getx/controllers/quiz_controller.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required this.quizController,
    required this.timer,
  }) : super(key: key);

  final QuizController quizController;
  final Timer timer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Obx(
        () => OutlinedButton(
          onPressed: () {
            quizController.onNextAction(timer);
          },
          child: Text(
            "NEXT",
            style: TextStyle(color: Colors.white),
          ),
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            backgroundColor: quizController.optionSelected.isEmpty
                ? Color(0xFF9E9E9E)
                : Colors.red,
            padding: EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
