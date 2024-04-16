part of 'profile_picture_cubit.dart';

@freezed
class ProfilePictureState with _$ProfilePictureState {
  const factory ProfilePictureState(
    {required String? uploadedImageUrl, 
    required String? errorMessage}
  ) = _Initial;
}
