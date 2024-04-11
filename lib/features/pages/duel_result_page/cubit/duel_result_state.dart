part of 'duel_result_cubit.dart';

@freezed
class DuelResultState with _$DuelResultState {
  const factory DuelResultState(
      {required String? errorMessage,
      required List<ProfileModel> profiles,
      
      required Status status,
      required String? gameLenght,
      required Duration? gameDuration}) = _Initial;
}
