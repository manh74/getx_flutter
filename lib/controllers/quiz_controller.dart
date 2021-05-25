import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:the_quiz_app_getx/models/quiz.model.dart';
import 'package:the_quiz_app_getx/utils/convert_html_to_dart.dart';

class QuizController extends GetxController {
  var quizList = <QuizModel>[].obs;
  var isLoading = true.obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt numberCurrentQuestion = 1.obs;
  RxInt correctAnswer = 0.obs;
  RxInt answerTimeCount = 0.obs;
  var optionSelected = ''.obs;

  var titleAchievement = ''.obs;
  var messageAchievement = ''.obs;
  var imageAchievement = ''.obs;

  int get quizLength => quizList.length;

  int get optionsLength => currentQuestion.questionOptions.length;

  String get questionTitle => convertHTMLToDart(currentQuestion.question);

  QuizModel get currentQuestion => quizList[currentQuestionIndex.value];

  @override
  void onInit() {
    loadQuizes();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    print(isLoading);
    super.onReady();
  }

  Future<void> loadQuizes() async {
    var url = Uri.parse(
        "https://opentdb.com/api.php?amount=10&category=18&type=multiple");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var quiz = json.decode(response.body)['results'];
      List<QuizModel> quizs = List<QuizModel>.from(
        quiz.map((_) => QuizModel.fromJson(_)),
      );
      quizList.value = quizs;

      isLoading.value = false;
      print('quizList.length ----> ${quizList.length}');
      update();
    } else {
      throw Exception("Error");
    }
  }

  void onNextAction(Timer timer) {
    if (optionSelected.isEmpty) return;

    if (optionSelected.value == currentQuestion.correctAnswer) {
      correctAnswer++;
    }

    if (currentQuestionIndex < 9) {
      currentQuestionIndex++;
      numberCurrentQuestion++;
      optionSelected = ''.obs;
      update();
    } else {
      timer.cancel();
      setAchievement();
      Get.toNamed("/result");
    }
  }

  void onPlayAgain() {
    currentQuestionIndex = 0.obs;
    numberCurrentQuestion = 1.obs;
    answerTimeCount = 0.obs;
    optionSelected = ''.obs;
    isLoading.value = false;
    Get.toNamed('/');
    loadQuizes();
    update();
  }

  void timeCounter() {
    const oneSec = const Duration(seconds: 1);
    Timer timer = Timer.periodic(oneSec, (Timer timer) {
      answerTimeCount++;
      print(answerTimeCount);
    });
  }

  void setAchievement() {
    titleAchievement.value = 'Complete!';
    messageAchievement.value = 'Better luck next time!';
    imageAchievement.value = 'assets/images/complete.png';
    if (correctAnswer.value > 5) {
      titleAchievement.value = 'Congratulation';
      messageAchievement.value = 'You are amazing!';
      imageAchievement.value = 'assets/images/congrats.png';
    }
  }
}
