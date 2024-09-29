// class QuestionsModel {
//   String? allowedTime;
//   String? passmark;
//   List<Question>? questions;

//   QuestionsModel({
//     this.allowedTime,
//     this.passmark,
//     this.questions,
//   });

//   factory QuestionsModel.fromJson(Map<String, dynamic> json) {
//     var questionsList = json['questions'] as List?;
//     List<Question>? questions =
//         questionsList?.map((i) => Question.fromJson(i)).toList();

//     return QuestionsModel(
//       allowedTime: json['allowed_time'],
//       passmark: json['passmark'],
//       questions: questions,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'allowed_time': allowedTime,
//       'passmark': passmark,
//       'questions': questions?.map((question) => question.toJson()).toList(),
//     };
//   }
// }

// class Question {
//   String? question;
//   String? choiceA;
//   String? choiceB;
//   String? choiceC;
//   String? choiceD;
//   String? answer;

//   Question({
//     this.question,
//     this.choiceA,
//     this.choiceB,
//     this.choiceC,
//     this.choiceD,
//     this.answer,
//   });

//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       question: json['question'],
//       choiceA: json['choicea'],
//       choiceB: json['choiceb'],
//       choiceC: json['choicec'],
//       choiceD: json['choiced'],
//       answer: json['answer'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'question': question,
//       'choicea': choiceA,
//       'choiceb': choiceB,
//       'choicec': choiceC,
//       'choiced': choiceD,
//       'answer': answer,
//     };
//   }
// }

class QuestionsModel {
  String? allowedTime;
  List<Question>? questions;

  QuestionsModel({
    this.allowedTime,
    this.questions,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    var questionsList = json['questions'] as List?;
    List<Question>? questions =
        questionsList?.map((i) => Question.fromJson(i)).toList();

    return QuestionsModel(
      allowedTime: json['allowed_time'],
      questions: questions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'allowed_time': allowedTime,
      'questions': questions?.map((question) => question.toJson()).toList(),
    };
  }
}

class Question {
  String? question;
  String? choiceA;
  String? choiceB;
  String? choiceC;
  String? choiceD;
  String? answer;

  Question({
    this.question,
    this.choiceA,
    this.choiceB,
    this.choiceC,
    this.choiceD,
    this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      choiceA: json['choiceA'],
      choiceB: json['choiceB'],
      choiceC: json['choiceC'],
      choiceD: json['choiceD'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'choiceA': choiceA,
      'choiceB': choiceB,
      'choiceC': choiceC,
      'choiceD': choiceD,
      'answer': answer,
    };
  }
}
