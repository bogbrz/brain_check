part of 'root_page_cubit.dart';

@freezed
class RootPageState with _$RootPageState {


  factory RootPageState({required User? user, required String errorMessage}) =
      _RootPageState;
}