import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_model.g.dart';
part 'categories_model.freezed.dart';

@freezed
class Welcome with _$Welcome {
  factory Welcome({
    required List<TriviaCategory> triviaCategories,
  }) = _Welcome;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        triviaCategories: List<TriviaCategory>.from(
            json["trivia_categories"].map((x) => TriviaCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "trivia_categories":
            List<dynamic>.from(triviaCategories.map((x) => x.toJson())),
      };
}

@freezed
class TriviaCategory with _$TriviaCategory {
  factory TriviaCategory({
    required int id,
    required String name,
  }) = _TriviaCategory;

  factory TriviaCategory.fromJson(Map<String, dynamic> json) => TriviaCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
