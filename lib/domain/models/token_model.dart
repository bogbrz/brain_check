import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/token_model.freezed.dart';
part 'generated/token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  // ignore: invalid_annotation_target
  @JsonSerializable()
  factory TokenModel(
      {required int? response,
      required String? responeMessage,
      required String? token}) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
