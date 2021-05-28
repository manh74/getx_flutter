import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.PRIMARY_COLOR,
      statusBarBrightness: Brightness.light,
    ));
    return GetMaterialApp(
      title: "The Quiz App",
      defaultTransition: Transition.leftToRightWithFade,
      initialRoute: "/",
      getPages: routes(),
    );
  }
}
