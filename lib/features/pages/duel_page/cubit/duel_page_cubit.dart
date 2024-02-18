import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/repositories/duel_game_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duel_page_state.dart';
part 'duel_page_cubit.freezed.dart';

class DuelPageCubit extends Cubit<DuelPageState> {
  DuelPageCubit({required this.duelGameRepository})
      : super(DuelPageState(errorMessage: null));

  final DuelGameRepository duelGameRepository;

  Future<void> createRoom(
      {required String name, required String password}) async {
    return duelGameRepository.createRoom(name: name, password: password);
  }
}
