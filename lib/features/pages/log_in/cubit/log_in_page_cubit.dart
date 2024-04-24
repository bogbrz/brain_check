import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_in_page_state.dart';
part 'generated/log_in_page_cubit.freezed.dart';

class LogInPageCubit extends Cubit<LogInPageState> {
  LogInPageCubit({
    required this.authRepository,
  }) : super(LogInPageState(
          user: null,
          errorMessage: "",
        ));
  final AuthRepository authRepository;
  StreamSubscription? streamSubscription;

  Future<void> authStateChanges() async {
    streamSubscription = authRepository.authStateChanges().listen((user) {
      try {
        emit(LogInPageState(user: user, errorMessage: ""));
      } catch (error) {
        emit(LogInPageState(user: null, errorMessage: error.toString()));
      }
    });
  }

  Future<void> signInWitEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await authRepository.signInWitEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      emit(LogInPageState(
        user: null,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password, }) async {
    try {
      await authRepository.createUserWithEmailAndPassword(
          email: email, password: password,);
    } catch (error) {
      LogInPageState(
        user: null,
        errorMessage: error.toString(),
      );
    }
  }

  Future<void> setNickName() async {}
}
