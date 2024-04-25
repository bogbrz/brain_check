part of 'result_cubit.dart';

@freezed
class ResultState with _$ResultState {
  const factory ResultState(
      {required String? errorMessage,
      required List<ProfileModel> profiles,
      
      required Status status,
      required String? gameLenght,
      required Duration? gameDuration}) = _Initial;
}
