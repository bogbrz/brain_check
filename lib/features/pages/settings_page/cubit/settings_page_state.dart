part of 'settings_page_cubit.dart';

@freezed
class SettingsPageState with _$SettingsPageState {
  const factory SettingsPageState({required String? errorMessage, required List<ProfileModel> profile}) = _Initial;
}
