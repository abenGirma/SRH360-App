class CourseCategory {
  String id;
  String title;

  CourseCategory({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory CourseCategory.fromMap(Map<String, dynamic> map, String id) {
    return CourseCategory(
      id: id,
      title: map['title'] ?? '',
    );
  }
}
