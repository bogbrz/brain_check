import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_page_state.dart';
part 'settings_page_cubit.freezed.dart';

class SettingsPageCubit extends Cubit<SettingsPageState> {
  SettingsPageCubit({required this.rankingRepository})
      : super(SettingsPageState(errorMessage: null));
  final RankingRepository rankingRepository;
  Future<void> addProfile(
      {required String nickName, required String email}) async {
    await rankingRepository.addProfile(nickName: nickName, email: email);
  }
}
