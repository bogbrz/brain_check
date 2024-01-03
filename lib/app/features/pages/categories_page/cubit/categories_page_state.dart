part of 'categories_page_cubit.dart';

@freezed
class CategoriesPageState with _$CategoriesPageState {
   factory CategoriesPageState({required String? errorMessage, required List<TriviaCategory> categories }) = _Initial;
}
