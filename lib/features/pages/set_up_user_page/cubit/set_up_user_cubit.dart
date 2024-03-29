import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_up_user_state.dart';
part 'set_up_user_cubit.freezed.dart';

class SetUpUserCubit extends Cubit<SetUpUserState> {
  SetUpUserCubit({required this.rankingRepository})
      : super(const SetUpUserState(
          errorMessage: null,
          profile: [],
        status: Status.initial));
  final RankingRepository rankingRepository;

  StreamSubscription? streamSubscription;

  Future<void> getRankingForUpdate({required String email}) async {
    emit(SetUpUserState(errorMessage: null, profile: [], status: Status.loading));
    streamSubscription =
        rankingRepository.getRankingForUpdate(email: email).listen((event) {
      try {
        emit(SetUpUserState(errorMessage: null, profile: event, status: Status.success));
      } catch (error) {
        emit(SetUpUserState(errorMessage: error.toString(), profile: [], status: Status.error));
      }
    });
  }

  Future<void> addProfileToGlobalRanking(
      {required String nickName, required String email}) async {
    await rankingRepository.addProfileToGlobal(
        nickName: nickName, email: email);
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
