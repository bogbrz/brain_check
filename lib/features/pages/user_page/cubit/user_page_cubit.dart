import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';
import 'package:brain_check/domain/models/profile_model.dart';
import 'package:brain_check/domain/repositories/authentication_repository.dart';
import 'package:brain_check/domain/repositories/ranking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_page_state.dart';
part 'user_page_cubit.freezed.dart';

class UserPageCubit extends Cubit<UserPageState> {
  UserPageCubit({required this.authRepository, required this.rankingRepository})
      : super(const UserPageState(
            errorMessage: null, profile: [], status: Status.initial));
  final AuthRepository authRepository;
  final RankingRepository rankingRepository;
  StreamSubscription? streamSubscription;

  Future<void> getRankingForUpdate({required String email}) async {
    emit(
        UserPageState(errorMessage: null, profile: [], status: Status.loading));
    streamSubscription =
        rankingRepository.getRankingForUpdate(email: email).listen((event) {
      try {
        emit(UserPageState(
            errorMessage: null, profile: event, status: Status.success));
      } catch (error) {
        emit(UserPageState(
            errorMessage: error.toString(), profile: [], status: Status.error));
      }
    });
  }

  Future<void> signOut() async {
    return authRepository.signOut();
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
