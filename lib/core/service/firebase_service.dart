import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:srh360app/modules/create_questions/model/create_question_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addQuestion(QuestionModel question) async {
    try {
      await _firestore.collection('questions').add(question.toMap());
    } catch (e) {
      print('Error adding question to Firebase: $e');
    }
  }

  static Future<Either<String, Unit>> addCourses() async {
    try {
      await FirebaseFirestore.instance
          .collection('Coursecodes')
          .add({'name': 'Reproductive', 'code': 1001});
      return right(unit);
    } catch (error) {
      return left("Failed to add course: $error");
    }
  }

  Future<Either<String, Unit>> postData({
    required String collectionName,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collectionName).add(data);
      return right(unit);
    } catch (error) {
      return left("Failed to add data to $collectionName: $error");
    }
  }

  Future<Either<String, List<Map<String, dynamic>>>> getAllData({
    required String collectionName,
  }) async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection(collectionName).get();

      List<Map<String, dynamic>> dataList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      return right(dataList);
    } catch (error) {
      return left("Failed to get data from $collectionName: $error");
    }
  }

  Future<Either<String, List<Map<String, dynamic>>>> getDataByField({
    required String collectionName,
    required String fieldName,
    required String fieldValue,
  }) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(collectionName)
          .where(fieldName, isEqualTo: fieldValue)
          .get();

      List<Map<String, dynamic>> documents = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      return right(documents);
    } catch (error) {
      return left("Failed to get data from $collectionName: $error");
    }
  }
}
