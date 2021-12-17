// To parse this JSON data, do
//
//     final questionByIdModel = questionByIdModelFromJson(jsonString);

import 'dart:convert';

QuestionByIdModel questionByIdModelFromJson(String str) => QuestionByIdModel.fromJson(json.decode(str));

String questionByIdModelToJson(QuestionByIdModel data) => json.encode(data.toJson());

class QuestionByIdModel {
    QuestionByIdModel({
        this.items,
    });

    final List<Item>? items;

    factory QuestionByIdModel.fromJson(Map<String, dynamic> json) => QuestionByIdModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items??[].map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.tags,
        this.owner,
        this.viewCount,
        this.lastActivityDate,
        this.creationDate,
        this.questionId,
        this.bodyMarkdown,
        this.title,
    });

    final List<String>? tags;
    final Owner? owner;
    final int? viewCount;
    final int? lastActivityDate;
    final int? creationDate;
    final int? questionId;
    final String? bodyMarkdown;
    final String? title;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        tags: List<String>.from(json["tags"].map((x) => x)),
        owner: Owner.fromJson(json["owner"]),
        viewCount: json["view_count"],
        lastActivityDate: json["last_activity_date"],
        creationDate: json["creation_date"],
        questionId: json["question_id"],
        bodyMarkdown: json["body_markdown"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags??[].map((x) => x)),
        "owner": owner!.toJson(),
        "view_count": viewCount,
        "last_activity_date": lastActivityDate,
        "creation_date": creationDate,
        "question_id": questionId,
        "body_markdown": bodyMarkdown,
        "title": title,
    };
}

class Owner {
    Owner({
        this.badgeCounts,
        this.userId,
        this.profileImage,
        this.displayName,
    });

    final BadgeCounts? badgeCounts;
    final int? userId;
    final String? profileImage;
    final String? displayName;

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        badgeCounts: BadgeCounts.fromJson(json["badge_counts"]),
        userId: json["user_id"],
        profileImage: json["profile_image"],
        displayName: json["display_name"],
    );

    Map<String, dynamic> toJson() => {
        "badge_counts": badgeCounts!.toJson(),
        "user_id": userId,
        "profile_image": profileImage,
        "display_name": displayName,
    };
}

class BadgeCounts {
    BadgeCounts({
        this.bronze,
        this.silver,
        this.gold,
    });

    final int? bronze;
    final int? silver;
    final int? gold;

    factory BadgeCounts.fromJson(Map<String, dynamic> json) => BadgeCounts(
        bronze: json["bronze"],
        silver: json["silver"],
        gold: json["gold"],
    );

    Map<String, dynamic> toJson() => {
        "bronze": bronze,
        "silver": silver,
        "gold": gold,
    };
}
