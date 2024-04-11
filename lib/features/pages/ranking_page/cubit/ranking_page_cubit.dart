import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_page_state.dart';
part 'generated/ranking_page_cubit.freezed.dart';

class RankingPageCubit extends Cubit<RankingPageState> {
  RankingPageCubit({required this.rankingRepository})
      : super(const RankingPageState(
            errorMessage: null, profiles: [], status: Status.initial));
  StreamSubscription? streamSubscription;
  final RankingRepository rankingRepository;

  Future<void> getRanking() async {
    emit(const RankingPageState(
        errorMessage: null, profiles: [], status: Status.loading));
    streamSubscription = rankingRepository.getRanking().listen((event) {
      try {
        emit(RankingPageState(
            errorMessage: null, profiles: event, status: Status.success));
      } catch (error) {
        emit(RankingPageState(
            errorMessage: error.toString(),
            profiles: [],
            status: Status.error));
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
