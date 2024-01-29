import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/authentication_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_page_state.dart';
part 'user_page_cubit.freezed.dart';

class UserPageCubit extends Cubit<UserPageState> {
  UserPageCubit({required this.authRepository, required this.rankingRepository})
      : super(UserPageState(errorMessage: null, profile: []));

  final AuthRepository authRepository;
  final RankingRepository rankingRepository;
  StreamSubscription? streamSubscription;

  Future<void> getProfile() async {
    streamSubscription = rankingRepository.getProfile().listen((event) {
      try {
        emit(UserPageState(errorMessage: null, profile: event));
      } catch (error) {
        emit(UserPageState(errorMessage: error.toString(), profile: []));
      }
    });
  }
   Future<void> getProfileWithId({required String id}) async {
    streamSubscription = rankingRepository.getProfile().listen((event) {
      try {
        emit(UserPageState(errorMessage: null, profile: event));
      } catch (error) {
        emit(UserPageState(errorMessage: error.toString(), profile: []));
      }
    });
  }

  Future<void> getRanking() async {
    streamSubscription = rankingRepository.getRanking().listen((event) {
      try {
        emit(UserPageState(errorMessage: null, profile: event));
      } catch (error) {
        emit(UserPageState(errorMessage: error.toString(), profile: []));
      }
    });
  }

  Future<void> updateRanking({required int points, required String id}) async {
    try {
      return rankingRepository.updateRanking(points: points, id: id);
    } catch (error) {
      throw Exception(error.toString());
    }
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
