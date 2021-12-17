// To parse this JSON data, do
//
//     final questionsModel = questionsModelFromJson(jsonString);

import 'dart:convert';

QuestionsModel questionsModelFromJson(String str) =>
    QuestionsModel.fromJson(json.decode(str));

String questionsModelToJson(QuestionsModel data) => json.encode(data.toJson());

class QuestionsModel {
  QuestionsModel({
    this.items,
  });

  final List<Item>? items;

  factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items ?? [].map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.questionId,
    required this.title,
  });

  final int questionId;
  final String title;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        questionId: json["question_id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "title": title,
      };
}
