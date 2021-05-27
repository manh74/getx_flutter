import 'package:get/get.dart';

import 'package:the_quiz_app_getx/controllers/quiz_controller.dart';

class QuizBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
  }
}