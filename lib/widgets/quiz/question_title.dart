import 'package:flutter/material.dart';

Widget questionTitleSection(BuildContext context, int index) {
  index++;
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(bottom: 20),
    child: Text.rich(
      TextSpan(
          text: "Question $index",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white),
          children: [
            TextSpan(
                text: "/10",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white))
          ]),
    ),
  );
}
