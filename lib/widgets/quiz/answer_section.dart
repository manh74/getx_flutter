import 'package:flutter/material.dart';
import 'package:the_quiz_app_getx/utils/icons/app_icons.dart';

answerSection(double size, String options, Function chooseAnswer, bool answer) {
  return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
          width: size,
          child: OutlinedButton(
              onPressed: () {
                chooseAnswer(options);
              },
              style: OutlinedButton.styleFrom(
                  primary: answer ? Colors.white : Colors.red,
                  shadowColor: answer ? Colors.white : Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  side: BorderSide(color: answer ? Colors.white : Colors.red),
                  padding: EdgeInsets.all(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      options,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Icon(
                    answer
                        ? MyFlutterApp.circle_empty
                        : MyFlutterApp.ok_circled,
                    color: answer ? Colors.white : Colors.red,
                  )
                ],
              ))));
}
