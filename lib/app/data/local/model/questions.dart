class LocalQuestionsModel {
  final int? id;
  final String columnTitle;
  final int columnCreateDate;

  LocalQuestionsModel(
      {this.id, required this.columnTitle, required this.columnCreateDate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'columnTitle': columnTitle,
      'columnCreateDate': columnCreateDate
    };
  }
}
