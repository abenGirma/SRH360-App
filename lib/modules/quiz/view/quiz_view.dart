import 'package:flutter/material.dart';
import 'package:srh360app/core/constant/theme/app_theme.dart';
import 'package:srh360app/core/shared/common_button.dart';
import 'package:srh360app/modules/courses/view/courses_view.dart';
import 'package:srh360app/modules/quiz/controller/quiz_controller.dart';
import 'package:srh360app/modules/quiz/widgets/cutom_choice_button.dart';
import 'package:srh360app/modules/quiz/widgets/quiz_custom_background.dart';
import 'package:srh360app/modules/quiz/widgets/quiz_header.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Future<bool> popmessage(String message) async {
      Duration duration = const Duration(seconds: 3);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          duration: duration,
        ),
      );
      await Future.delayed(duration);
      return false;
    }

    return PopScope(
      onPopInvoked: (bool didPop) async {
        await popmessage("You can not return once the Exam started");
      },
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Obx(
            () => controller.question.isEmpty
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                : Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            height: height * 0.35,
                            child: CustomBackground(child: QuizHeader()),
                          ),
                          Container(
                            width: width,
                            height: height * 0.65,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                children: [
                                  CustomChoiceButton(
                                    text:
                                        'A. ${controller.question[controller.currentIndex.value].choiceA ?? ""}',
                                    onTap: () {
                                      controller.updateAnswer(
                                          1, controller.currentIndex.value);
                                    },
                                    isSelected: controller.useranswers[
                                            controller.currentIndex.value] ==
                                        1,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  CustomChoiceButton(
                                    text:
                                        'B. ${controller.question[controller.currentIndex.value].choiceB ?? ""}',
                                    onTap: () {
                                      controller.updateAnswer(
                                          2, controller.currentIndex.value);
                                    },
                                    isSelected: controller.useranswers[
                                            controller.currentIndex.value] ==
                                        2,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  CustomChoiceButton(
                                    text:
                                        'C. ${controller.question[controller.currentIndex.value].choiceC ?? ""}',
                                    onTap: () {
                                      controller.updateAnswer(
                                          3, controller.currentIndex.value);
                                    },
                                    isSelected: controller.useranswers[
                                            controller.currentIndex.value] ==
                                        3,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  CustomChoiceButton(
                                    text:
                                        'D. ${controller.question[controller.currentIndex.value].choiceD ?? ""}',
                                    onTap: () {
                                      controller.updateAnswer(
                                          4, controller.currentIndex.value);
                                    },
                                    isSelected: controller.useranswers[
                                            controller.currentIndex.value] ==
                                        4,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomButton(
                                    text: controller.currentIndex !=
                                            controller.question.length - 1
                                        ? "Next Question"
                                        : "Submit",
                                    onPressed: () {
                                      controller.forward();
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
