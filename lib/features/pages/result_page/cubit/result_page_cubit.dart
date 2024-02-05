import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_page_state.dart';
part 'result_page_cubit.freezed.dart';

class ResultPageCubit extends Cubit<ResultPageState> {
  ResultPageCubit({required this.rankingRepository}) : super(const ResultPageState(errorMessage: null, profile: []));

  final RankingRepository rankingRepository;
  StreamSubscription? streamSubscription;

  Future<void> getRankingForUpdate({required String email}) async {
    streamSubscription =
        rankingRepository.getRankingForUpdate(email: email).listen((event) {
      try {
        emit(ResultPageState(errorMessage: null, profile: event));
      } catch (error) {
        emit(ResultPageState(errorMessage: error.toString(), profile: []));
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
   @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
