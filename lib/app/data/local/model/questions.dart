class LocalQuestionsModel {
  final int? id;
  final String columnTitle;

  LocalQuestionsModel(
      {this.id, required this.columnTitle});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'columnTitle': columnTitle,
    };
  }
}
