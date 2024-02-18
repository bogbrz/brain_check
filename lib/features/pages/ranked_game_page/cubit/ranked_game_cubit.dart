import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranked_game_state.dart';
part 'ranked_game_cubit.freezed.dart';

class RankedGameCubit extends Cubit<RankedGameState> {
  RankedGameCubit({required this.rankingRepository})
      : super(RankedGameState(
            errorMessage: null, profile: [], status: Status.initial));

  final RankingRepository rankingRepository;
  StreamSubscription? streamSubscription;
  Future<void> getRankingForUpdate({required String email}) async {
    emit(RankedGameState(
        errorMessage: null, profile: [], status: Status.loading));

    streamSubscription =
        rankingRepository.getRankingForUpdate(email: email).listen((event) {
      try {
        emit(RankedGameState(
            errorMessage: null, profile: event, status: Status.success));
      } catch (error) {
        emit(RankedGameState(
            errorMessage: error.toString(), profile: [], status: Status.error));
      }
    });
  }

  Future<void> restoreLifes() async {
    await rankingRepository.getRanking().listen((event) {
      for (final profile in event) {
        rankingRepository.restoreLifes(
          id: profile.id,
        );
      }
    });
  }
}
