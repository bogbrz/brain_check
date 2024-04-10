import 'package:bloc/bloc.dart';
import 'package:brain_check/app/core/enums/enums.dart';

import 'package:brain_check/domain/models/categories_model.dart';
import 'package:brain_check/domain/repositories/questions_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_page_state.dart';
part 'generated/categories_page_cubit.freezed.dart';

class CategoriesPageCubit extends Cubit<CategoriesPageState> {
  CategoriesPageCubit({required this.questionRepository})
      : super(CategoriesPageState(
          errorMessage: null,
          categories: [],
          status: Status.initial,
        ));

  final QuestionRepository questionRepository;

  Future<void> getCategories() async {
    emit(CategoriesPageState(
      errorMessage: null,
      categories: [],
      status: Status.loading,
    ));
    try {
      final categories = await questionRepository.getCategories();

      emit(CategoriesPageState(
        errorMessage: null,
        categories: categories,
        status: Status.success,
      ));

      // print(categories);
    } catch (error) {
      emit(CategoriesPageState(
        errorMessage: error.toString(),
        categories: [],
        status: Status.error,
      ));
    }
  }
}
