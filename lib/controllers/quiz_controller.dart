import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'package:the_quiz_app_getx/models/quiz.model.dart';

class QuizController extends GetxController {
  var quiz =<QuizModel>[].obs;

  var isLoading = true.obs;


  int get quizLength => quiz.length;
  RxInt currentQuestionIndex = 0.obs;
  RxInt answerTimeCount = 0.obs;
  var optionSelected = ''.obs;

  QuizModel get currentQuestion => quiz[currentQuestionIndex.value];

  @override
  Future<void> onReady() async {
    print(isLoading);
    await loadQuizes();
    super.onReady();
  }

  void onNextAction(Timer timer) {
    if(optionSelected.isEmpty) return;

    if (currentQuestionIndex < 9) {
      currentQuestionIndex++;
      optionSelected = ''.obs;
      update();
    } else {
      timer.cancel();
      Get.toNamed("/result");
      update();
    }
  }

  void onPlayAgain() {
    currentQuestionIndex = 0.obs;
    answerTimeCount = 0.obs;
    Get.toNamed('/');
    update();
  }

  Future<void> loadQuizes() async {
    var url = Uri.parse(
        "https://opentdb.com/api.php?amount=10&category=18&type=multiple");
    var response = await http.get(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var quiz = json.decode(response.body)['results'];
      List<QuizModel> quizs = List<QuizModel>.from(
        quiz.map((_) => QuizModel.fromJson(_)),
      );
      print(quizs.length);

      quiz = quizs;

      print("Q: ${quiz[currentQuestionIndex.value].question}");
      isLoading.value = false;
    } else {
      throw Exception("Error");
    }
  }
}
