import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/authentication_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'global_user_state.dart';
part 'global_user_cubit.freezed.dart';

class GlobalUserCubit extends Cubit<GlobalUserState> {
  GlobalUserCubit(
      {required this.authRepository, required this.rankingRepository})
      : super(GlobalUserState(errorMessage: null, profile: []));
  final AuthRepository authRepository;
  final RankingRepository rankingRepository;
  StreamSubscription? streamSubscription;
  Future<void> getProfile() async {
    streamSubscription = rankingRepository.getProfile().listen((event) {
      try {
        emit(GlobalUserState(errorMessage: null, profile: event));
      } catch (error) {
        emit(GlobalUserState(errorMessage: error.toString(), profile: []));
      }
    });
  }
  Future<void> updateStats({required int points, required String id}) async {
    try {
      return rankingRepository.updateStats(points: points, id: id);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> getRanking() async {
    streamSubscription = rankingRepository.getRanking().listen((event) {
      try {
        emit(GlobalUserState(errorMessage: null, profile: event));
      } catch (error) {
        emit(GlobalUserState(errorMessage: error.toString(), profile: []));
      }
    });
  }

  Future<void> addProfile(
      {required String nickName, required String email}) async {
    await rankingRepository.addProfile(nickName: nickName, email: email);
  }

  Future<void> addProfileToGlobalRanking(
      {required String nickName, required String email}) async {
    await rankingRepository.addProfileToGlobal(
        nickName: nickName, email: email);
  }

  Future<void> signOut() async {
    return authRepository.signOut();
  }
}
