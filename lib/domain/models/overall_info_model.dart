

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Overall overall;
    Map<String, Overall> categories;

    Welcome({
        required this.overall,
        required this.categories,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        overall: Overall.fromJson(json["overall"]),
        categories: Map.from(json["categories"]).map((k, v) => MapEntry<String, Overall>(k, Overall.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "overall": overall.toJson(),
        "categories": Map.from(categories).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Overall {
    int totalNumOfQuestions;
    int totalNumOfPendingQuestions;
    int totalNumOfVerifiedQuestions;
    int totalNumOfRejectedQuestions;

    Overall({
        required this.totalNumOfQuestions,
        required this.totalNumOfPendingQuestions,
        required this.totalNumOfVerifiedQuestions,
        required this.totalNumOfRejectedQuestions,
    });

    factory Overall.fromJson(Map<String, dynamic> json) => Overall(
        totalNumOfQuestions: json["total_num_of_questions"],
        totalNumOfPendingQuestions: json["total_num_of_pending_questions"],
        totalNumOfVerifiedQuestions: json["total_num_of_verified_questions"],
        totalNumOfRejectedQuestions: json["total_num_of_rejected_questions"],
    );

    Map<String, dynamic> toJson() => {
        "total_num_of_questions": totalNumOfQuestions,
        "total_num_of_pending_questions": totalNumOfPendingQuestions,
        "total_num_of_verified_questions": totalNumOfVerifiedQuestions,
        "total_num_of_rejected_questions": totalNumOfRejectedQuestions,
    };
}
