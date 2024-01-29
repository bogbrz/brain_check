part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({required String? errorMessage, required List<ProfileModel> profile}) = _Initial;
}
