import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.rankingRepository})
      : super(HomePageState(errorMessage: null, profile: []));
  final RankingRepository rankingRepository;
  StreamSubscription? streamSubscription;

  Future<void> getProfile() async {
    streamSubscription = rankingRepository.getProfile().listen((event) {
      try {
        emit(HomePageState(errorMessage: null, profile: event));
      } catch (error) {
        emit(HomePageState(errorMessage: error.toString(), profile: []));
      }
    });
  }
}
