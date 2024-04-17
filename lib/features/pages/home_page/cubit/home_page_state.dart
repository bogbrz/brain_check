part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState(
      {required String? errorMessage,
      required List<ProfileModel> profile,
      required Overall overAllInfo,
      required Status status,
      required String? uploadedImageUrl, }) = _Initial;
}
