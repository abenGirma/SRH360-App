import 'package:srh360app/model/lesson.dart';

class Course {
  String id;
  String categoryID;
  String name;
  String description;
  int progress;
  List<Lesson> lessons;
  String imageUrl;

  Course({
    required this.id,
    required this.categoryID,
    required this.name,
    required this.description,
    required this.progress,
    required this.lessons,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'category_id': categoryID,
      'name': name,
      'description': description,
      'progress': progress,
      'lessons': lessons.map((lesson) => lesson.toMap()).toList(),
      'image_url': imageUrl
    };
  }

  factory Course.fromMap(Map<String, dynamic> map, String documentId) {
    return Course(
      id: documentId,
      categoryID: map['category_id'],
      name: map['name'],
      description: map['description'],
      progress: map['progress'],
      lessons: List<Lesson>.from(
        map['lessons'].map((lessonMap) => Lesson.fromMap(lessonMap)),
      ),
      imageUrl: map['image_url'],
    );
  }
}
