import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/duel_question_model.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_question_page_state.dart';
part 'duel_question_page_cubit.freezed.dart';

class DuelQuestionPageCubit extends Cubit<DuelQuestionPageState> {
  DuelQuestionPageCubit({
    required this.duelGameRepository,
  }) : super(DuelQuestionPageState(
            questions: [], errorMessage: null, status: Status.initial));
  final DuelGameRepository duelGameRepository;

  Future<void> getQfromFb({required String roomId}) async {
    emit(DuelQuestionPageState(
        errorMessage: null, questions: [], status: Status.loading));
    duelGameRepository.getQuestionsFromFb(roomId: roomId).listen((event) {
      try {
        emit(DuelQuestionPageState(
            errorMessage: null, questions: event, status: Status.success));
      } catch (e) {
        emit(DuelQuestionPageState(
            errorMessage: e.toString(), questions: [], status: Status.error));
      }
    });
  }
}
