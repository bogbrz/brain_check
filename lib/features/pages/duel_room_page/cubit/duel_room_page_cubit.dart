import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/player_model.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_room_page_state.dart';
part 'duel_room_page_cubit.freezed.dart';

class DuelRoomPageCubit extends Cubit<DuelRoomPageState> {
  DuelRoomPageCubit({required this.duelGameRepository})
      : super(DuelRoomPageState(
            errorMessage: null, status: Status.initial, playerOne: []));
  final DuelGameRepository duelGameRepository;

  Future<void> joinPlayerOne(
      {required String email,
      required String nickName,
      required String id}) async {
    return duelGameRepository.joinPlayerOne(
        email: email, nickName: nickName, id: id);
  }

  Future<void> leaveRoom({required String id, required String roomId}) async {
    return duelGameRepository.leaveRoom(id: id, roomId: roomId);
  }
  Future<void> deleteRoom({required String id, }) async {
    return duelGameRepository.deleteRoom(id: id, );
  }


  Future<void> playerOneInfo({required String id}) async {
    await duelGameRepository.getPlayerOneInfo(id: id).listen((event) {
      try {
        emit(DuelRoomPageState(
            errorMessage: null, status: Status.success, playerOne: event));
      } catch (e) {
        emit(DuelRoomPageState(
            errorMessage: e.toString(), status: Status.error, playerOne: []));
      }
    });
  }
}
