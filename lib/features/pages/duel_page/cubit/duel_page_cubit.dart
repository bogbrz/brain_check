import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/game_room_model.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_page_state.dart';
part 'duel_page_cubit.freezed.dart';

class DuelPageCubit extends Cubit<DuelPageState> {
  DuelPageCubit({required this.duelGameRepository})
      : super(DuelPageState(
            errorMessage: null, rooms: [], status: Status.initial, ));

  final DuelGameRepository duelGameRepository;

  Future<void> createRoom(
      {required String name, required String password, required String nickName}) async {
    return duelGameRepository.createRoom(name: name, password: password, nickName: nickName);
  }

  Future<void> getRooms() async {
    emit(DuelPageState(errorMessage: null, rooms: [], status: Status.loading, ));

    duelGameRepository.getRooms().listen((event) {
      try {
        emit(DuelPageState(
            errorMessage: null, rooms: event, status: Status.success));
      } catch (e) {
        emit(DuelPageState(
            errorMessage: e.toString(), rooms: [], status: Status.error));
      }
    });
  }
}