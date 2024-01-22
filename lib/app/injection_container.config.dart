// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:brain_check/app/injection_container.dart' as _i12;
import 'package:brain_check/data_sources/authentication_data_source.dart'
    as _i3;
import 'package:brain_check/data_sources/questions_data_source.dart' as _i8;
import 'package:brain_check/domain/repositories/authentication_repository.dart'
    as _i4;
import 'package:brain_check/domain/repositories/questions_repository.dart'
    as _i9;
import 'package:brain_check/features/pages/categories_page/cubit/categories_page_cubit.dart'
    as _i10;
import 'package:brain_check/features/pages/log_in/cubit/log_in_page_cubit.dart'
    as _i5;
import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart'
    as _i11;
import 'package:brain_check/features/pages/root_page/cubit/root_page_cubit.dart'
    as _i6;
import 'package:dio/dio.dart' as _i7;
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
    gh.factory<_i3.AuthDataSource>(() => _i3.AuthDataSource());
    gh.factory<_i4.AuthRepository>(
        () => _i4.AuthRepository(authDataSource: gh<_i3.AuthDataSource>()));
    gh.factory<_i5.LogInPageCubit>(
        () => _i5.LogInPageCubit(authRepository: gh<_i4.AuthRepository>()));
    gh.factory<_i6.RootPageCubit>(
        () => _i6.RootPageCubit(authRepository: gh<_i4.AuthRepository>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i7.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i8.QuestionDataSource>(
        () => _i8.QuestionDataSource(gh<_i7.Dio>()));
    gh.factory<_i9.QuestionRepository>(() => _i9.QuestionRepository(
        questionDataSource: gh<_i8.QuestionDataSource>()));
    gh.factory<_i10.CategoriesPageCubit>(() => _i10.CategoriesPageCubit(
        questionRepository: gh<_i9.QuestionRepository>()));
    gh.factory<_i11.QuestionPageCubit>(() => _i11.QuestionPageCubit(
        questionRepository: gh<_i9.QuestionRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
