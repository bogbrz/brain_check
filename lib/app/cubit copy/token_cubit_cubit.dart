import 'package:bloc/bloc.dart';
import 'package:brain_check/domain/models/token_model.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'token_cubit_state.dart';
part 'token_cubit_cubit.freezed.dart';

@injectable
class TokenCubitCubit extends Cubit<TokenCubitState> {
  TokenCubitCubit({required this.questionRepository})
      : super(TokenCubitState(
            tokenModel: TokenModel(response: 0, responeMessage: "", token: ""),
            errorMessage: null));
  final QuestionRepository questionRepository;
  Future<void> fetchToken() async {
    final tokenModel = await questionRepository.fetchToken();
    print("CUBIT $tokenModel");

    emit(TokenCubitState(tokenModel: tokenModel, errorMessage: null));
  }
}
