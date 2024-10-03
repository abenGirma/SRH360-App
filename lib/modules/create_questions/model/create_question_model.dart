class QuestionModel {
  String question;
  String choiceA;
  String choiceB;
  String choiceC;
  String choiceD;
  String answer;
  String courseId;
  String timeAllowed;

  QuestionModel({
    required this.question,
    required this.choiceA,
    required this.choiceB,
    required this.choiceC,
    required this.choiceD,
    required this.answer,
    required this.courseId,
    required this.timeAllowed,
  });

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'choiceA': choiceA,
      'choiceB': choiceB,
      'choiceC': choiceC,
      'choiceD': choiceD,
      'answer': answer,
      'courseId': courseId,
      'timeAllowed': timeAllowed,
    };
  }
}
