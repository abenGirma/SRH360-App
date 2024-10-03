import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srh360app/modules/quiz/controller/quiz_controller.dart';

class ChooseExamCourseView extends GetView<QuizController> {
  final controller = Get.put(QuizController());
  final List<String> courses = ["Course 1", "Course 2", "Course 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Choose Exam Course',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFD8CFFF), Color(0xFFEDF5FF)],
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Displaying one per row for better alignment
            childAspectRatio: 4, // Adjust aspect ratio for horizontal layout
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return _buildCourseButton(
              context,
              courses[index],
              Icons.school,
              Color.fromARGB(255, 144, 69, 201),
              () {
                onCourseSelected(courses[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildCourseButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.6),
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: color, size: 30),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color, size: 20),
          ],
        ),
      ),
    );
  }

  void onCourseSelected(String course) {
    controller.fetchQuestionsByCourseId(course);
    Get.toNamed('/exam');
  }
}
