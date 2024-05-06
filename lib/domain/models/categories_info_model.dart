// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/categories_info_model.freezed.dart';
part 'generated/categories_info_model.g.dart';

@freezed
class WelcomeCategory with _$WelcomeCategory {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory WelcomeCategory({
    required int? categoryId,
    required CategoryQuestionCount? categoryQuestionCount,
  }) = _WelcomeCategory;

  factory WelcomeCategory.fromJson(Map<String, dynamic> json) =>
      _$WelcomeCategoryFromJson(json);
}

@freezed
class CategoryQuestionCount with _$CategoryQuestionCount {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory CategoryQuestionCount({
    required int totalQuestionCount,
    required int totalEasyQuestionCount,
    required int totalMediumQuestionCount,
    required int totalHardQuestionCount,
  }) = _CategoryQuestionCount;

  factory CategoryQuestionCount.fromJson(Map<String, dynamic> json) =>
      _$CategoryQuestionCountFromJson(json);
}
