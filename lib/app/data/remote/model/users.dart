// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
    UsersModel({
        required this.items,
        this.hasMore,
        this.quotaMax,
        this.quotaRemaining,
    });

    final List<Item> items;
    final bool? hasMore;
    final int? quotaMax;
    final int? quotaRemaining;

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
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
        required this.badgeCounts,
        this.accountId,
        this.isEmployee,
        this.lastAccessDate,
        this.reputationChangeYear,
        this.reputationChangeQuarter,
        this.reputationChangeMonth,
        this.reputationChangeWeek,
        this.reputationChangeDay,
        this.reputation,
        this.creationDate,
        this.userType,
        this.userId,
        this.link,
        this.profileImage,
        this.displayName,
    });

    final BadgeCounts badgeCounts;
    final int? accountId;
    final bool? isEmployee;
    final int? lastAccessDate;
    final int? reputationChangeYear;
    final int? reputationChangeQuarter;
    final int? reputationChangeMonth;
    final int? reputationChangeWeek;
    final int? reputationChangeDay;
    final int? reputation;
    final int? creationDate;
    final String? userType;
    final int? userId;
    final String? link;
    final String? profileImage;
    final String? displayName;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        badgeCounts: BadgeCounts.fromJson(json["badge_counts"]),
        accountId: json["account_id"],
        isEmployee: json["is_employee"],
        lastAccessDate: json["last_access_date"],
        reputationChangeYear: json["reputation_change_year"],
        reputationChangeQuarter: json["reputation_change_quarter"],
        reputationChangeMonth: json["reputation_change_month"],
        reputationChangeWeek: json["reputation_change_week"],
        reputationChangeDay: json["reputation_change_day"],
        reputation: json["reputation"],
        creationDate: json["creation_date"],
        userType: json["user_type"],
        userId: json["user_id"],
        link: json["link"],
        profileImage: json["profile_image"],
        displayName: json["display_name"],
    );

    Map<String, dynamic> toJson() => {
        "badge_counts": badgeCounts.toJson(),
        "account_id": accountId,
        "is_employee": isEmployee,
        "last_access_date": lastAccessDate,
        "reputation_change_year": reputationChangeYear,
        "reputation_change_quarter": reputationChangeQuarter,
        "reputation_change_month": reputationChangeMonth,
        "reputation_change_week": reputationChangeWeek,
        "reputation_change_day": reputationChangeDay,
        "reputation": reputation,
        "creation_date": creationDate,
        "user_type": userType,
        "user_id": userId,
        "link": link,
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
