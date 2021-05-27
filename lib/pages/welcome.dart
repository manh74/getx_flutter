import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_quiz_app_getx/controllers/quiz_controller.dart';

class Welcome extends StatelessWidget {
  // final quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: Color(0xFF26294B),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/robot.png',
            height: size.height / 4,
          ),
          _buildStartButton(context),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 150,
        height: 50,
        child: OutlinedButton(
          child: Text(
            'Start Quiz!',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Color(0xFFD01624),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
          onPressed: () {
            Get.toNamed("/quiz");
          },
        ),
      ),
    );
  }
}
