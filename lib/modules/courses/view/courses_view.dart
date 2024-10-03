import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srh360app/modules/courses/controller/courses_controller.dart';

class CoursesView extends GetView<CoursesController> {
  CoursesView({super.key});
  final courseController = Get.put(CoursesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: courseController.additem, child: Text("Add Item")),
        ),
      ),
    );
  }
}
