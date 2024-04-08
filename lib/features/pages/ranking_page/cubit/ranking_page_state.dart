part of 'ranking_page_cubit.dart';

@freezed
class RankingPageState with _$RankingPageState {
  const factory RankingPageState(
      {required String? errorMessage,
      required List<ProfileModel> profiles,
      required Status status}) = _RankingPageState;
}
