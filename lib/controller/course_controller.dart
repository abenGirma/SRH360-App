import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:srh360app/model/course.dart';
import 'package:srh360app/model/course_category.dart';
import 'package:srh360app/model/lesson.dart';

class CourseController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var courses = <Course>[].obs;
  var courseCategoreis = <CourseCategory>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllCategories();
    fetchCourses();
  }

  void fetchCourses() async {
    try {
      isLoading(true);
      QuerySnapshot snapshot = await _firestore.collection('courses').get();
      var courseList = snapshot.docs.map((doc) {
        return Course.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      courses.assignAll(courseList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch courses');
    } finally {
      isLoading(false);
    }
  }

  void fetchCoursesByCategory(String categoryID) async {
    QuerySnapshot? snapshot;
    try {
      isLoading(true);
      if (categoryID == 'All') {
        snapshot = await _firestore.collection('courses').get();
      } else {
        snapshot = await _firestore
            .collection('courses')
            .where('category_id', isEqualTo: categoryID)
            .get();
      }

      var courseList = snapshot!.docs.map((doc) {
        return Course.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      courses.assignAll(courseList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch courses by category');
    } finally {
      isLoading(false);
    }
  }

  Future<void> addCourse(Course course) async {
    try {
      DocumentReference docRef =
          await _firestore.collection('courses').add(course.toMap());
      course.id = docRef.id;
      courses.add(course);
    } catch (e) {
      Get.snackbar('Error', 'Failed to add course');
    }
  }

  Future<void> addCategory(CourseCategory course) async {
    try {
      DocumentReference docRef =
          await _firestore.collection('course_categories').add(course.toMap());
      course.id = docRef.id;
      // courses.add(course);
    } catch (e) {
      Get.snackbar('Error', 'Failed to add course');
    }
  }

  void fetchAllCategories() async {
    try {
      isLoading(true);

      QuerySnapshot snapshot =
          await _firestore.collection('course_categories').get();

      var categoryList = snapshot.docs.map((doc) {
        return CourseCategory.fromMap(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      // CourseCategory category = CourseCategory(id: 'id', title: 'All');
      // categoryList.add(category);

      courseCategoreis.assignAll(categoryList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch categories');
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateCourse(Course course) async {
    try {
      await _firestore
          .collection('courses')
          .doc(course.id)
          .update(course.toMap());
      int index = courses.indexWhere((c) => c.id == course.id);
      if (index != -1) {
        courses[index] = course;
        courses.refresh();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update course');
    }
  }

  Future<void> deleteCourse(String courseId) async {
    try {
      await _firestore.collection('courses').doc(courseId).delete();
      courses.removeWhere((course) => course.id == courseId);
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete course');
    }
  }

  // Add a new lesson to a course
  Future<void> addLesson(String courseId, Lesson lesson) async {
    try {
      Course? course = courses.firstWhereOrNull((c) => c.id == courseId);
      if (course != null) {
        course.lessons.add(lesson);
        await updateCourse(course);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add lesson');
    }
  }

  // Update a lesson in a course
  Future<void> updateLesson(String courseId, Lesson updatedLesson) async {
    try {
      Course? course = courses.firstWhereOrNull((c) => c.id == courseId);
      if (course != null) {
        int lessonIndex = course.lessons
            .indexWhere((lesson) => lesson.name == updatedLesson.name);
        if (lessonIndex != -1) {
          course.lessons[lessonIndex] = updatedLesson;
          await updateCourse(course);
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update lesson');
    }
  }

  // Delete a lesson from a course
  Future<void> deleteLesson(String courseId, String lessonName) async {
    try {
      Course? course = courses.firstWhereOrNull((c) => c.id == courseId);
      if (course != null) {
        course.lessons.removeWhere((lesson) => lesson.name == lessonName);
        await updateCourse(course);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete lesson');
    }
  }
}
