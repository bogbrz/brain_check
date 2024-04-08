part of 'token_cubit_cubit.dart';

@freezed
class TokenCubitState with _$TokenCubitState {
  const factory TokenCubitState(
      {required TokenModel tokenModel,
      required String? errorMessage}) = _Initial;
}
