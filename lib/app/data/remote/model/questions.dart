// To parse this JSON data, do
//
//     final questionsModel = questionsModelFromJson(jsonString);

import 'dart:convert';

QuestionsModel questionsModelFromJson(String str) => QuestionsModel.fromJson(json.decode(str));

String questionsModelToJson(QuestionsModel data) => json.encode(data.toJson());

class QuestionsModel {
    QuestionsModel({
        required this.items,
        this.hasMore,
        this.quotaMax,
        this.quotaRemaining,
    });

    final List<Item> items;
    final bool? hasMore;
    final int? quotaMax;
    final int? quotaRemaining;

    factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        hasMore: json["has_more"],
        quotaMax: json["quota_max"],
        quotaRemaining: json["quota_remaining"],
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "has_more": hasMore,
        "quota_max": quotaMax,
        "quota_remaining": quotaRemaining,
    };
}

class Item {
    Item({
        this.tags,
        required this.owner,
        this.isAnswered,
        this.viewCount,
        this.answerCount,
        this.score,
        this.lastActivityDate,
        this.creationDate,
        this.questionId,
        this.contentLicense,
        this.link,
        this.title,
    });

    final List<String>? tags;
    final Owner owner;
    final bool? isAnswered;
    final int? viewCount;
    final int? answerCount;
    final int? score;
    final int? lastActivityDate;
    final int? creationDate;
    final int? questionId;
    final String? contentLicense;
    final String? link;
    final String? title;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        tags: List<String>.from(json["tags"].map((x) => x)),
        owner: Owner.fromJson(json["owner"]),
        isAnswered: json["is_answered"],
        viewCount: json["view_count"],
        answerCount: json["answer_count"],
        score: json["score"],
        lastActivityDate: json["last_activity_date"],
        creationDate: json["creation_date"],
        questionId: json["question_id"],
        contentLicense: json["content_license"],
        link: json["link"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags??[].map((x) => x)),
        "owner": owner.toJson(),
        "is_answered": isAnswered,
        "view_count": viewCount,
        "answer_count": answerCount,
        "score": score,
        "last_activity_date": lastActivityDate,
        "creation_date": creationDate,
        "question_id": questionId,
        "content_license": contentLicense,
        "link": link,
        "title": title,
    };
}

class Owner {
    Owner({
        this.accountId,
        this.reputation,
        this.userId,
        this.userType,
        this.profileImage,
        this.displayName,
        this.link,
    });

    final int? accountId;
    final int? reputation;
    final int? userId;
    final String? userType;
    final String? profileImage;
    final String? displayName;
    final String? link;

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        accountId: json["account_id"],
        reputation: json["reputation"],
        userId: json["user_id"],
        userType: json["user_type"],
        profileImage: json["profile_image"],
        displayName: json["display_name"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "reputation": reputation,
        "user_id": userId,
        "user_type": userType,
        "profile_image": profileImage,
        "display_name": displayName,
        "link": link,
    };
}
