import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:the_quiz_app_getx/controllers/quiz_controller.dart';
import 'package:the_quiz_app_getx/utils/colors.dart';
import 'package:the_quiz_app_getx/widgets/box_decoration.dart';

class Result extends StatelessWidget {
  final quizController = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.PRIMARY_COLOR,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: Get.size.width / 3,
                      bottom: Get.size.width / 3),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: myBoxDecoration(),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        quizController.imageAchievement.value,
                      ),
                      Text(
                        quizController.titleAchievement.value,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        quizController.messageAchievement.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black87),
                      ),
                      Text(
                        "${quizController.correctAnswer} correct answers in ${quizController.answerTimeCount} seconds.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black87),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: OutlinedButton(
                            child: Text(
                              'Play Again',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color(0xFFD01624),
                            ),
                            onPressed: () {
                              quizController.onPlayAgain();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
