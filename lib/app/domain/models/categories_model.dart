import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_model.freezed.dart';
part 'categories_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory CategoryModel({
    required List<TriviaCategory> triviaCategories,
  }) = _CategoryModel;
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class TriviaCategory with _$TriviaCategory {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory TriviaCategory({required int id, required String name}) =
      _TriviaCategory;
  factory TriviaCategory.fromJson(Map<String, dynamic> json) =>
      _$TriviaCategoryFromJson(json);
}
