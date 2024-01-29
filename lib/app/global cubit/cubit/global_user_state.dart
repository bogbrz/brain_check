part of 'global_user_cubit.dart';

@freezed
class GlobalUserState with _$GlobalUserState {
  const factory GlobalUserState(
      {required String? errorMessage,
      required List<ProfileModel> profile}) = _Initial;
}
