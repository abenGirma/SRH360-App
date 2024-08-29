class Lesson {
  String name;
  bool isCompleted;
  String headerImage;
  String title;
  String body;

  Lesson({
    required this.name,
    required this.isCompleted,
    required this.headerImage,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isCompleted': isCompleted,
      'headerImage': headerImage,
      'title': title,
      'body': body
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      name: map['name'],
      isCompleted: map['isCompleted'],
      headerImage: map['headerImage'],
      title: map['title'],
      body: map['body'],
    );
  }
}
