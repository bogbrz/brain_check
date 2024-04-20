part of 'user_page_cubit.dart';

@freezed
class UserPageState with _$UserPageState {
  const factory UserPageState(
      {required String? errorMessage,
      required List<ProfileModel> profile,
      required Status status,
      required String? uploadedImageUrl, 
       }) = _UserPageState;
}
