import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srh360app/core/service/firebase_service.dart';
import 'package:srh360app/core/service/snackbar.dart';
import 'package:srh360app/modules/create_questions/model/create_question_model.dart';

class CreateQuestionController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  var question = ''.obs;
  var choiceA = ''.obs;
  var choiceB = ''.obs;
  var choiceC = ''.obs;
  var choiceD = ''.obs;
  var answer = ''.obs;
  var courseId = ''.obs;
  var timeAllowed = ''.obs;

  RxList<QuestionModel> questions = <QuestionModel>[].obs;

  bool get isFormValid =>
      question.isNotEmpty &&
      choiceA.isNotEmpty &&
      choiceB.isNotEmpty &&
      choiceC.isNotEmpty &&
      choiceD.isNotEmpty &&
      answer.isNotEmpty &&
      courseId.isNotEmpty &&
      timeAllowed.isNotEmpty;

  bool get isSubmitEnabled => questions.isNotEmpty;

  void addQuestion() {
    if (isFormValid) {
      questions.add(QuestionModel(
        question: question.value,
        choiceA: choiceA.value,
        choiceB: choiceB.value,
        choiceC: choiceC.value,
        choiceD: choiceD.value,
        answer: answer.value,
        courseId: courseId.value,
        timeAllowed: timeAllowed.value,
      ));
      clearForm();
    }
  }

  void clearForm() {
    question.value = '';
    choiceA.value = '';
    choiceB.value = '';
    choiceC.value = '';
    choiceD.value = '';
    answer.value = '';
    courseId.value = '';
    timeAllowed.value = '';
  }

  Future<Either<String, Unit>> submitQuestions() async {
    for (var question in questions) {
      final result = await _firebaseService.postData(
        collectionName: 'questions',
        data: question.toMap(),
      );
      if (result.isLeft()) {
        CustomSnackBar.popMessage("YSomething went wrong");
        return result;
      }
    }
    questions.clear();
    CustomSnackBar.popMessage("Your Question is added", isSuccess: true);
    return right(unit);
  }

  Future<Either<String, Unit>> addCourse(String name, int code) async {
    return await _firebaseService.postData(
      collectionName: 'Coursecodes',
      data: {'name': name, 'code': code},
    );
  }
}
