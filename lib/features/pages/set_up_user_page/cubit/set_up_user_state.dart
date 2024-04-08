part of 'set_up_user_cubit.dart';

@freezed
class SetUpUserState with _$SetUpUserState {
  const factory SetUpUserState(
      {required String? errorMessage,
      required List<ProfileModel> profile,
      required Status status}) = _SetUpUserState;
}
