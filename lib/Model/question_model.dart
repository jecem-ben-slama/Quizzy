class QuestionModel {
  String? category;
  String? type;
  String? difficulty;
  String? question;
  String? correctAnswer;
  List? incorrectAnswer;

  QuestionModel(this.category, this.type, this.difficulty, this.question,
      this.correctAnswer, this.incorrectAnswer);
}
