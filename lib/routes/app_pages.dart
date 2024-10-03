import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:srh360app/modules/choose_exam_course/view/choose_exam_course.dart';
import 'package:srh360app/modules/create_questions/view/createquestion_view.dart';
import 'package:srh360app/modules/menu/view/menu_view.dart';
import 'package:srh360app/modules/quiz/view/quiz_view.dart';
import 'package:srh360app/modules/quiz/widgets/quiz_binding.dart';
import 'package:srh360app/modules/results/view/result_view.dart';
import 'package:srh360app/modules/upload_questions/view/upload_questions_view.dart';
import 'package:srh360app/presentation/auth/auth.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(name: Routes.MENUROUTE, page: () => MenuView()),
    GetPage(name: Routes.CREATEQUESTION, page: () => CreateQuestionView()),
    GetPage(name: Routes.CHOOSEEXAMCOURSE, page: () => ChooseExamCourseView()),
    GetPage(
      name: Routes.EXAMROUTE,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: Routes.RESULTROUTE,
      page: () => ResultPage(),
    ),
    GetPage(name: Routes.UPLOADQUESTIONS, page: () => UploadQuestionsView()),
    GetPage(name: Routes.LOGINROUTE, page: () => AuthPage()),
  ];
}
