import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.rankingRepository})
      : super(const HomePageState(errorMessage: null, profile: []));
  final RankingRepository rankingRepository;
  StreamSubscription? streamSubscription;

  Future<void> getRankingForUpdate({required String email}) async {
    streamSubscription =
        rankingRepository.getRankingForUpdate(email: email).listen((event) {
      try {
        emit(HomePageState(errorMessage: null, profile: event));
      } catch (error) {
        emit(HomePageState(errorMessage: error.toString(), profile: []));
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
