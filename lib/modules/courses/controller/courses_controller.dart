import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:srh360app/core/service/firebase_service.dart';
import 'package:srh360app/core/service/snackbar.dart';

class CoursesController extends GetxController {
  additem() async {
    final addcourse = await FirebaseService.addCourses();
    addcourse.fold((l) {
      return Left(() => CustomSnackBar.popMessage("Operation Unsuccessful"));
    }, (r) {
      return Right(true);
    });
  }
}
