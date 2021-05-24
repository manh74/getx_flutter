import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:the_quiz_app_getx/controllers/quiz_controller.dart';
import 'package:the_quiz_app_getx/widgets/box_decoration.dart';

class Result extends StatelessWidget {
  final quizController = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    String title, message, image;

    Size size = MediaQuery.of(context).size;

    image = 'assets/images/congrats.png';
    title = 'Congratulation!';
    message = 'You are amazing!';

    return Material(
      child: Column(children: <Widget>[
        Container(
          height: size.height,
          width: size.width,
          color: Color(0xFF26294B),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: size.width / 3,
                          bottom: size.width / 3),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: myBoxDecoration(),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            image,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black87),
                          ),
                          Text(
                            "${quizController.answerTimeCount} correct answers in ${quizController.answerTimeCount} seconds.",
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
                      )),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
