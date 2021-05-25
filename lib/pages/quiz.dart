import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:the_quiz_app_getx/controllers/quiz_controller.dart';
import 'package:the_quiz_app_getx/utils/icons/app_icons.dart';
import 'package:the_quiz_app_getx/widgets/quiz/question_card.dart';

class Quiz extends StatelessWidget {
  final quizController = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xFF26294B),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFF26294B),
      body: quizController.isLoading.value
          ? SpinKitFadingCube(color: Colors.white)
          : _buildQuestionBox(context),
    );
  }

  Widget _buildQuestionBox(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    const oneSec = const Duration(seconds: 1);
    Timer timer = Timer.periodic(oneSec, (Timer timer) {
      quizController.answerTimeCount++;
    });

    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Question ${quizController.currentQuestionIndex}",
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
          Padding(
            padding: EdgeInsets.all(10),
            child: questionSection(quizController.currentQuestion.question),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, i) {
              return optionsSection(size,
                  "${quizController.currentQuestion.questionOptions[i]}", i);
            },
          ),
          SizedBox(
            width: 300,
            child: OutlinedButton(
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
          )
        ],
      ),
    );
  }

  Widget optionsSection(Size size, dynamic option, int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: size.width,
        child: OutlinedButton(
          onPressed: () {
            quizController.optionSelected.value = option;
            print(quizController.optionSelected);
          },
          style: OutlinedButton.styleFrom(
            primary: quizController.optionSelected.isEmpty
                ? Color(0xFF9E9E9E)
                : Colors.red,
            shadowColor: quizController.optionSelected.isEmpty
                ? Colors.white
                : Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            side: BorderSide(
              color: quizController.optionSelected.isEmpty
                  ? Colors.white
                  : Colors.red,
            ),
            padding: EdgeInsets.all(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  option,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: quizController.optionSelected.isEmpty
                        ? Colors.white
                        : Colors.red,
                  ),
                ),
              ),
              Icon(
                quizController.optionSelected.isEmpty
                    ? MyFlutterApp.circle_empty
                    : MyFlutterApp.ok_circled,
                color: quizController.optionSelected.isEmpty
                    ? Colors.white
                    : Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
