import 'package:bloc/bloc.dart';
import 'package:brain_check/app/domain/models/categories_model.dart';
import 'package:brain_check/app/domain/repositories/questions_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_page_state.dart';
part 'categories_page_cubit.freezed.dart';

class CategoriesPageCubit extends Cubit<CategoriesPageState> {
  CategoriesPageCubit({required this.questionRepository})
      : super(CategoriesPageState(errorMessage: null, categories: []));

  final QuestionRepository questionRepository;

  Future<void> getCategories() async {
    try {
      final categories = await questionRepository.getCategories();
     
        emit(CategoriesPageState(errorMessage: null, categories: categories));
      
      print(categories);
    } catch (error) {
      print(error.toString());
      emit(CategoriesPageState(errorMessage: error.toString(), categories: []));
    }
  }
}