import 'package:get/get.dart';
import 'package:srh360app/modules/quiz/controller/quiz_controller.dart';

class QuizBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(() => QuizController());
  }
}
