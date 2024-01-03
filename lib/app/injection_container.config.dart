// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:brain_check/app/data_sources/questions_data_source.dart' as _i4;
import 'package:brain_check/app/domain/repositories/questions_repository.dart'
    as _i5;
import 'package:brain_check/app/features/pages/categories_page/cubit/categories_page_cubit.dart'
    as _i6;
import 'package:brain_check/app/features/pages/question_page/cubit/question_page_cubit.dart'
    as _i7;
import 'package:brain_check/app/injection_container.dart' as _i8;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i3.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i4.QuestionDataSource>(
        () => _i4.QuestionDataSource(gh<_i3.Dio>()));
    gh.factory<_i5.QuestionRepository>(() => _i5.QuestionRepository(
        questionDataSource: gh<_i4.QuestionDataSource>()));
    gh.factory<_i6.CategoriesPageCubit>(() => _i6.CategoriesPageCubit(
        questionRepository: gh<_i5.QuestionRepository>()));
    gh.factory<_i7.QuestionPageCubit>(() => _i7.QuestionPageCubit(
        questionRepository: gh<_i5.QuestionRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
