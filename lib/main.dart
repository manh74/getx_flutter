import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:the_quiz_app_getx/routes.dart';
import 'package:the_quiz_app_getx/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "The Quiz App",
      theme: ThemeData(
        primarySwatch: AppColors.WHITE,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      getPages: routes(),
    );
  }
}