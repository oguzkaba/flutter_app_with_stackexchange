class LocalQuestionsModel {
  final int? id;
  final String? title;

  LocalQuestionsModel({this.id,this.title});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  @override
  String toString() {
    return 'LocalQuestionsModel{id: $id, title: $title}';
  }
}
