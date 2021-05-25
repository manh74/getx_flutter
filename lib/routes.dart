import 'package:get/get.dart';

import 'package:the_quiz_app_getx/pages/quiz.dart';
import 'package:the_quiz_app_getx/pages/result.dart';
import 'package:the_quiz_app_getx/pages/welcome.dart';

routes() => [
      GetPage(name: "/", page: () => Welcome()),
      GetPage(name: "/quiz", page: () => Quiz()),
      GetPage(name: "/result", page: () => Result()),
    ];
