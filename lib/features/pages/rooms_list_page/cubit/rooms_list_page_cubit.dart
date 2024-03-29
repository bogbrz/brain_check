import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/game_room_model.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rooms_list_page_state.dart';
part 'rooms_list_page_cubit.freezed.dart';

class RoomsListPageCubit extends Cubit<RoomsListPageState> {
  RoomsListPageCubit({required this.duelGameRepository})
      : super(const RoomsListPageState(
            errorMessage: null, rooms: [], status: Status.initial, ));

  final DuelGameRepository duelGameRepository;

  Future<void> createRoom(
      {required String name, required String password, required String nickName}) async {
    return duelGameRepository.createRoom(name: name, password: password, nickName: nickName);
  }

  Future<void> getRooms() async {
    emit(const RoomsListPageState(errorMessage: null, rooms: [], status: Status.loading, ));

    duelGameRepository.getRooms().listen((event) {
      try {
        emit(RoomsListPageState(
            errorMessage: null, rooms: event, status: Status.success,));
      } catch (e) {
        emit(RoomsListPageState(
            errorMessage: e.toString(), rooms: [], status: Status.error,));
      }
    });
  }
}
