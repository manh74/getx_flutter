import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:the_quiz_app_getx/controllers/quiz_controller.dart';
import 'package:the_quiz_app_getx/utils/colors.dart';
import 'package:the_quiz_app_getx/widgets/quiz/current_question_title.dart';
import 'package:the_quiz_app_getx/widgets/quiz/next_button.dart';
import 'package:the_quiz_app_getx/widgets/quiz/options.dart';
import 'package:the_quiz_app_getx/widgets/quiz/current_question_index.dart';

class Quiz extends StatelessWidget {
  final quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_COLOR,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              quizController.onClose();
            },
          ),
        ],
      ),
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Obx(
        () => quizController.isLoading.value
            ? SpinKitFadingCube(color: Colors.white)
            : _buildQuestionBox(context),
      ),
    );
  }

  Widget _buildQuestionBox(BuildContext context) {
    const oneSec = const Duration(seconds: 1);
    Timer timer;
    timer = Timer.periodic(oneSec, (Timer timer) {
      quizController.answerTimeCount++;
      print(quizController.answerTimeCount);
    });

    return ListView(
      children: <Widget>[
        QuestionIndex(quizController: quizController),
        CurrentQuestionTitle(quizController: quizController),
        Options(quizController: quizController),
        NextButton(quizController: quizController, timer: timer),
      ],
    );
  }
}
