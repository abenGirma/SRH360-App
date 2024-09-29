import 'dart:convert';
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:srh360app/core/constant/api_config.dart';
import 'package:srh360app/core/service/file_service.dart';
import 'package:srh360app/core/service/firebase_service.dart';
import 'package:srh360app/core/service/snackbar.dart';
import 'package:srh360app/core/util/helper/error/api_failure.dart';
import 'package:srh360app/core/util/helper/type_def.dart';
import 'package:srh360app/modules/quiz/model/question_model.dart';
import 'package:srh360app/modules/results/view/result_view.dart';
import 'package:srh360app/routes/app_pages.dart';
import 'dart:async';

// class QuizController extends GetxController {
//   final FirebaseService _firebaseService = FirebaseService();
//   RxInt secondsRemaining = 0.obs;
//   late Timer _timer;
//   var isVisible = true.obs;
//   int waiting = 3;
//   @override
//   void onInit() {
//     super.onInit();
//     readQuestions();
//     _secureScreen();
//   }

//   void _secureScreen() async {
//     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
//   }

//   Future<void> _unsecureScreen() async {
//     await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
//   }

//   String formatDuration(Duration duration) {
//     if (duration.inSeconds < 60) {
//       return '${duration.inSeconds.toString().padLeft(2, '0')} secs';
//     } else {
//       String twoDigits(int n) => n.toString().padLeft(2, '0');
//       String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//       String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//       return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
//     }
//   }

//   void _startTimer() {
//     const oneSec = Duration(seconds: 1);
//     _timer = Timer.periodic(oneSec, (timer) {
//       if (secondsRemaining < 1) {
//         _timer.cancel();
//         ComputeResult();
//         _unsecureScreen();
//         Get.toNamed(
//           Routes.RESULTROUTE,
//           arguments: {'result': finalScore, 'total': question.length},
//         );
//       } else {
//         secondsRemaining = secondsRemaining - 1;
//       }
//       if (secondsRemaining.value < 60) {
//         startBlinking();
//       }
//     });
//   }

//   void startBlinking() {
//     if (waiting == 1) {
//       isVisible.toggle();
//     } else {
//       if (waiting > 0) {
//         waiting--;
//         isVisible.value = true;
//       }
//     }
//   }

//   int finalScore = 0;
//   var currentIndex = 0.obs;
//   QuestionsModel? _questions;
//   RxList<Question> question = <Question>[].obs;
//   List<int> answers = [];
//   RxList<int> useranswers = <int>[].obs;
//   int timeallowed = 0;
//   int passmark = 0;
//   QuestionsModel? get quetions => _questions;
//   FutureResult<bool> readQuestions() async {
//     var readQuestion =
//         await FileService.readJSON(path: ApiConfig.questionDirectory);

//     return readQuestion.fold((l) {
//       return Left(ApiFailure(message: l.message));
//     }, (r) {
//       _questions = QuestionsModel.fromJson(r);
//       PopulateSections();
//       return const Right(true);
//     });
//   }

//   void PopulateSections() {
//     if (_questions?.questions != null) {
//       question.value = _questions!.questions!;
//       for (int i = 0; i < _questions!.questions!.length; i++) {
//         answers.add(int.parse(_questions!.questions![i].answer ?? "0"));
//         useranswers.add(0);
//       }
//     }
//     timeallowed = int.parse(_questions!.allowedTime!);
//     passmark = int.parse(_questions!.passmark!);
//     secondsRemaining.value = timeallowed * 60;
//     _startTimer();
//   }

//   void updateAnswer(int newentry, int index) {
//     useranswers[index] = newentry;
//   }

//   void forward() {
//     if (currentIndex < question.length - 1) {
//       currentIndex.value = currentIndex.value + 1;
//     } else if (currentIndex == question.length - 1) {
//       ComputeResult();
//       _unsecureScreen();
//       Get.toNamed(
//         Routes.RESULTROUTE,
//         arguments: {'result': finalScore, 'total': question.length},
//       );
//     }
//   }

//   void backward() {
//     if (currentIndex > 0) {
//       currentIndex.value = currentIndex.value - 1;
//     }
//   }

//   void ComputeResult() {
//     for (int i = 0; i < question.length; i++) {
//       if (answers[i] == useranswers[i]) {
//         finalScore++;
//       }
//     }
//   }

//   Future<void> fetchAllQuestions() async {
//     final result =
//         await _firebaseService.getAllData(collectionName: 'questions');

//     result.fold(
//       (error) {
//         print(error);
//       },
//       (data) {
//         print("Retrieved questions: $data");
//       },
//     );
//   }
// }

class QuizController extends GetxController {
  String SelectedCourse = "";
  final FirebaseService _firebaseService = FirebaseService();
  RxInt secondsRemaining = 0.obs;
  late Timer _timer;
  var isVisible = true.obs;
  int waiting = 3;
  int finalScore = 0;
  var currentIndex = 0.obs;
  RxList<Question> question = <Question>[].obs;
  List<int> answers = [];
  RxList<int> useranswers = <int>[].obs;
  int timeallowed = 0;
  QuestionsModel questionsModel = QuestionsModel();
  @override
  void onInit() {
    super.onInit();
    // fetchAllQuestions();
    _secureScreen();
  }

  void _secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  Future<void> _unsecureScreen() async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  String formatDuration(Duration duration) {
    if (duration.inSeconds < 60) {
      return '${duration.inSeconds.toString().padLeft(2, '0')} secs';
    } else {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
    }
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (secondsRemaining < 1) {
        _timer.cancel();
        ComputeResult();
        _unsecureScreen();
        Get.toNamed(
          Routes.RESULTROUTE,
          arguments: {'result': finalScore, 'total': question.length},
        );
      } else {
        secondsRemaining = secondsRemaining - 1;
      }
      if (secondsRemaining.value < 60) {
        startBlinking();
      }
    });
  }

  void startBlinking() {
    if (waiting == 1) {
      isVisible.toggle();
    } else {
      if (waiting > 0) {
        waiting--;
        isVisible.value = true;
      }
    }
  }

  Future<void> fetchAllQuestions() async {
    final result =
        await _firebaseService.getAllData(collectionName: 'questions');

    result.fold(
      (error) {
        print(error);
      },
      (data) {
        question.value = data.map((doc) => Question.fromJson(doc)).toList();
        answers = question.map((q) => int.parse(q.answer ?? "0")).toList();
        useranswers = RxList<int>.from(List.filled(question.length, 0));
        timeallowed = int.parse(questionsModel.allowedTime ?? "10");
        secondsRemaining.value = timeallowed * 60;
        _startTimer();
      },
    );
  }

  void updateAnswer(int newentry, int index) {
    useranswers[index] = newentry;
  }

  void forward() {
    if (currentIndex < question.length - 1) {
      currentIndex.value = currentIndex.value + 1;
    } else if (currentIndex == question.length - 1) {
      ComputeResult();
      _unsecureScreen();
      Get.toNamed(
        Routes.RESULTROUTE,
        arguments: {'result': finalScore, 'total': question.length},
      );
    }
  }

  void backward() {
    if (currentIndex > 0) {
      currentIndex.value = currentIndex.value - 1;
    }
  }

  void ComputeResult() {
    for (int i = 0; i < question.length; i++) {
      if (answers[i] == useranswers[i]) {
        finalScore++;
      }
    }
  }

  Future<void> fetchQuestionsByCourseId(String courseId) async {
    final result = await _firebaseService.getDataByField(
      collectionName: 'questions',
      fieldName: 'courseId',
      fieldValue: courseId,
    );

    result.fold(
      (error) {
        // print("Error fetching questions: $error");
        CustomSnackBar.popMessage("Couldn't get the Questions");
      },
      (data) {
        Get.toNamed(Routes.EXAMROUTE);
        question.value = data.map((doc) => Question.fromJson(doc)).toList();
        answers = question.map((q) => int.parse(q.answer ?? "0")).toList();
        useranswers = RxList<int>.from(List.filled(question.length, 0));
        timeallowed = int.parse(questionsModel.allowedTime ?? "10");
        secondsRemaining.value = timeallowed * 60;
        _startTimer();
      },
    );
  }
}
