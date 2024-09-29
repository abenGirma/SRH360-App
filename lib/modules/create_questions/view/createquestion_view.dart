import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srh360app/core/service/firebase_service.dart';
import 'package:srh360app/core/service/snackbar.dart';
import 'package:srh360app/modules/create_questions/controller/createquestion_controller.dart';

class CreateQuestionView extends StatelessWidget {
  final CreateQuestionController controller =
      Get.put(CreateQuestionController());
  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFD8CFFF), Color(0xFFEDF5FF)],
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              _buildHeader(),
              SizedBox(height: 30),
              _buildCourseDropdown(),
              SizedBox(height: 20),
              _buildQuestionInput(),
              SizedBox(height: 20),
              _buildAnswerInput("1. Choice A", controller.choiceA),
              SizedBox(height: 15),
              _buildAnswerInput("2. Choice B", controller.choiceB),
              SizedBox(height: 15),
              _buildAnswerInput("3. Choice C", controller.choiceC),
              SizedBox(height: 15),
              _buildAnswerInput("4. Choice D", controller.choiceD),
              SizedBox(height: 30),
              _buildCorrectAnswerDropdown(),
              SizedBox(height: 20),
              _buildTimeAllowedInput(),
              SizedBox(height: 40),
              _buildSaveButton(),
              SizedBox(height: 20),
              _buildSubmitButton(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      "Create Questions",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildCourseDropdown() {
    return Obx(() => DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Select Course",
            filled: true,
            fillColor: Colors.white.withOpacity(0.9),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          items: [
            DropdownMenuItem(value: "Course 1", child: Text("Course 1")),
            DropdownMenuItem(value: "Course 2", child: Text("Course 2")),
            DropdownMenuItem(value: "Course 3", child: Text("Course 3")),
          ],
          onChanged: (value) {
            controller.courseId.value = value ?? '';
          },
          value: controller.courseId.value.isEmpty
              ? null
              : controller.courseId.value,
        ));
  }

  Widget _buildQuestionInput() {
    return _buildTextField("Question", controller.question);
  }

  Widget _buildAnswerInput(String label, RxString answer) {
    return _buildTextField(label, answer);
  }

  Widget _buildCorrectAnswerDropdown() {
    return Obx(() => DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Correct Answer",
            filled: true,
            fillColor: Colors.white.withOpacity(0.9),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          items: [
            DropdownMenuItem(value: "1", child: Text("1")),
            DropdownMenuItem(value: "2", child: Text("2")),
            DropdownMenuItem(value: "3", child: Text("3")),
            DropdownMenuItem(value: "4", child: Text("4")),
          ],
          onChanged: (value) {
            controller.answer.value = value ?? '';
          },
          value:
              controller.answer.value.isEmpty ? null : controller.answer.value,
        ));
  }

  Widget _buildTimeAllowedInput() {
    return _buildTextField("Time Allowed (minutes)", controller.timeAllowed);
  }

  Widget _buildSaveButton() {
    return Obx(() => ElevatedButton(
          onPressed: controller.isFormValid
              ? () {
                  controller.addQuestion();
                }
              : null,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            elevation: 10,
            backgroundColor:
                controller.isFormValid ? Color(0xFF654EA3) : Colors.grey,
            shadowColor: Colors.black54,
          ),
          child: Text(
            "Save Question",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.5),
          ),
        ));
  }

  Widget _buildTextField(String label, RxString field) {
    final TextEditingController textController = TextEditingController();

    return Obx(() {
      if (textController.text != field.value) {
        textController.text = field.value;
        textController.selection = TextSelection.fromPosition(
          TextPosition(offset: textController.text.length),
        );
      }

      return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 0.5),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))
          ],
        ),
        padding: EdgeInsets.all(20),
        child: TextField(
          controller: textController,
          onChanged: (value) => field.value = value,
          style: TextStyle(fontSize: 18, color: Colors.black87),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey[600]),
            border: InputBorder.none,
          ),
        ),
      );
    });
  }

  Widget _buildSubmitButton() {
    return Obx(() => ElevatedButton(
          onPressed: controller.isSubmitEnabled
              ? () async {
                  final result = await controller.submitQuestions();
                  if (result.isRight()) {
                    CustomSnackBar.popMessage(
                        "Questions submitted successfully",
                        isSuccess: true);
                  }
                }
              : null,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            elevation: 10,
            backgroundColor: controller.isSubmitEnabled
                ? Color.fromARGB(255, 70, 163, 84)
                : Colors.grey,
            shadowColor: Colors.black54,
          ),
          child: Text(
            "Submit",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.normal,
              letterSpacing: 1.5,
            ),
          ),
        ));
  }
}
