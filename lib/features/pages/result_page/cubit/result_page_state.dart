part of 'result_page_cubit.dart';

@freezed
class ResultPageState with _$ResultPageState {
  const factory ResultPageState({required String? errorMessage, required List<ProfileModel> profile, required Status status}) = _Initial;
}
