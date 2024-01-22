import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/repositories/authentication_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';



part 'log_in_page_state.dart';
part 'log_in_page_cubit.freezed.dart';

class LogInPageCubit extends Cubit<LogInPageState> {
  LogInPageCubit({required this.authRepository})
      : super(LogInPageState(
          errorMessage: "",
        ));
  final AuthRepository authRepository;


  Future<void> signInWitEmailAndPassword(
      {required String email, required String password}) async {
    emit(LogInPageState(
      errorMessage: "",
    ));
    try {
       await authRepository.signInWitEmailAndPassword(
          email: email, password: password);
      emit(LogInPageState(
        errorMessage: "",
      ));
    } catch (error) {
      emit(LogInPageState(
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(LogInPageState(
      errorMessage: "",
    ));
    try {
     await authRepository.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(LogInPageState(
        errorMessage: "",
      ));
    } catch (error) {
      LogInPageState(
        errorMessage: error.toString(),
      );
    }
  }
}