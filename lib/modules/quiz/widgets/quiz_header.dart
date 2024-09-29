import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:srh360app/modules/quiz/controller/quiz_controller.dart';
import 'package:srh360app/modules/quiz/widgets/quiz_custom_background.dart';

class QuizHeader extends GetView<QuizController> {
  const QuizHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Obx(
      () => controller.question.isEmpty
          ? CustomBackground(child: SizedBox())
          : CustomBackground(
              child: Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => controller.backward(),
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Obx(
                                  () => Text(
                                    '${controller.currentIndex.value + 1} Of ${controller.question.length}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(flex: 2),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: height * 0.15,
                                child: SingleChildScrollView(
                                  child: Text(
                                    controller
                                            .question[
                                                controller.currentIndex.value]
                                            .question ??
                                        "",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Select the right answer",
                          style: TextStyle(fontSize: 14),
                        ),
                        Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child:
                                // Container(
                                //   width: 100,
                                //   height: 30,
                                //   child: Obx(() => Text(
                                //         controller.formatDuration(Duration(
                                //             seconds:
                                //                 controller.secondsRemaining.value)),
                                //         style: TextStyle(
                                //             fontSize: 17,
                                //             color:
                                //                 controller.secondsRemaining.value > 60
                                //                     ? Colors.black
                                //                     : Colors.red),
                                //       )),
                                // ),
                                Container(
                              width: 100,
                              height: 30,
                              child: Obx(
                                () => Visibility(
                                  visible: controller.isVisible.value,
                                  child: Text(
                                    controller.formatDuration(Duration(
                                        seconds:
                                            controller.secondsRemaining.value)),
                                    style: TextStyle(
                                      fontSize:
                                          controller.secondsRemaining.value > 60
                                              ? 17
                                              : 20,
                                      color:
                                          controller.secondsRemaining.value > 60
                                              ? Colors.black
                                              : Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
    );
  }
}
