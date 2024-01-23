// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:brain_check/app/global%20cubit/cubit/user_page_cubit.dart'
    as _i10;
import 'package:brain_check/app/injection_container.dart' as _i16;
import 'package:brain_check/data_sources/authentication_data_source.dart'
    as _i3;
import 'package:brain_check/data_sources/questions_data_source.dart' as _i12;
import 'package:brain_check/data_sources/ranking_data_source.dart' as _i6;
import 'package:brain_check/domain/repositories/authentication_repository.dart'
    as _i4;
import 'package:brain_check/domain/repositories/questions_repository.dart'
    as _i13;
import 'package:brain_check/domain/repositories/ranking_repository.dart' as _i7;
import 'package:brain_check/features/pages/categories_page/cubit/categories_page_cubit.dart'
    as _i14;
import 'package:brain_check/features/pages/log_in/cubit/log_in_page_cubit.dart'
    as _i5;
import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart'
    as _i15;
import 'package:brain_check/features/pages/root_page/cubit/root_page_cubit.dart'
    as _i8;
import 'package:brain_check/features/pages/settings_page/cubit/settings_page_cubit.dart'
    as _i9;
import 'package:dio/dio.dart' as _i11;
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
    gh.factory<_i6.RankingFireBaseDataSource>(
        () => _i6.RankingFireBaseDataSource());
    gh.factory<_i7.RankingRepository>(() => _i7.RankingRepository(
        rankingFireBaseDataSource: gh<_i6.RankingFireBaseDataSource>()));
    gh.factory<_i8.RootPageCubit>(
        () => _i8.RootPageCubit(authRepository: gh<_i4.AuthRepository>()));
    gh.factory<_i9.SettingsPageCubit>(() =>
        _i9.SettingsPageCubit(rankingRepository: gh<_i7.RankingRepository>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i10.UserPageCubit>(() => _i10.UserPageCubit(
          authRepository: gh<_i4.AuthRepository>(),
          rankingRepository: gh<_i7.RankingRepository>(),
        ));
    gh.lazySingleton<_i11.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i12.QuestionDataSource>(
        () => _i12.QuestionDataSource(gh<_i11.Dio>()));
    gh.factory<_i13.QuestionRepository>(() => _i13.QuestionRepository(
        questionDataSource: gh<_i12.QuestionDataSource>()));
    gh.factory<_i14.CategoriesPageCubit>(() => _i14.CategoriesPageCubit(
        questionRepository: gh<_i13.QuestionRepository>()));
    gh.factory<_i15.QuestionPageCubit>(() => _i15.QuestionPageCubit(
          questionRepository: gh<_i13.QuestionRepository>(),
          rankingRepository: gh<_i7.RankingRepository>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}
