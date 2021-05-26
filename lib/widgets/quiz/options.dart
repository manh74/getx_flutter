import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_quiz_app_getx/controllers/quiz_controller.dart';
import 'package:the_quiz_app_getx/utils/icons/app_icons.dart';

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.quizController,
  }) : super(key: key);

  final QuizController quizController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: quizController.optionsLength,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            width: Get.size.width,
            child: Obx(
              () => OutlinedButton(
                onPressed: () {
                  quizController.optionSelected.value =
                      quizController.currentQuestion.questionOptions[i];
                  quizController.onOptionIsSelected(i);
                },
                style: OutlinedButton.styleFrom(
                  primary: quizController.options[i]
                      ? Color(0xFF9E9E9E)
                      : Colors.red,
                  shadowColor:
                      quizController.options[i] ? Colors.red : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  side: BorderSide(
                    color:
                    quizController.options[i] ? Colors.red : Colors.white,
                  ),
                  padding: EdgeInsets.all(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "${quizController.currentQuestion.questionOptions[i]}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color:  quizController.options[i] ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                    Icon(
                      quizController.options[i]
                          ? MyFlutterApp.ok_circled
                          : MyFlutterApp.circle_empty,
                      color:
                          quizController.options[i] ? Colors.red : Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
