import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



part 'root_page_state.dart';
part 'root_page_cubit.freezed.dart';

class RootPageCubit extends Cubit<RootPageState> {
  RootPageCubit({required this.authRepository})
      : super(RootPageState(user: null, errorMessage: ""));
  StreamSubscription? streamSubscription;
  final AuthRepository authRepository;

  Future<void> authStateChanges() async {
    streamSubscription = authRepository.authStateChanges().listen((user) {
      try {
        emit(RootPageState(user: user, errorMessage: ""));
      } catch (error) {
        emit(RootPageState(user: null, errorMessage: error.toString()));
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