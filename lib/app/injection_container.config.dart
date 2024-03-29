// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:brain_check/app/cubit%20copy/token_cubit_cubit.dart' as _i18;
import 'package:brain_check/app/injection_container.dart' as _i23;
import 'package:brain_check/data_sources/authentication_data_source.dart'
    as _i3;
import 'package:brain_check/data_sources/questions_data_source.dart' as _i13;
import 'package:brain_check/data_sources/ranking_data_source.dart' as _i6;
import 'package:brain_check/domain/repositories/authentication_repository.dart'
    as _i4;
import 'package:brain_check/domain/repositories/questions_repository.dart'
    as _i14;
import 'package:brain_check/domain/repositories/ranking_repository.dart' as _i7;
import 'package:brain_check/features/pages/categories_page/cubit/categories_page_cubit.dart'
    as _i19;
import 'package:brain_check/features/pages/difficulty_page/cubit/difficulty_page_cubit.dart'
    as _i20;
import 'package:brain_check/features/pages/home_page/cubit/home_page_cubit.dart'
    as _i21;
import 'package:brain_check/features/pages/log_in/cubit/log_in_page_cubit.dart'
    as _i5;
import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart'
    as _i22;
import 'package:brain_check/features/pages/question_page_test/cubit/question_test_cubit.dart'
    as _i15;
import 'package:brain_check/features/pages/ranked_game_page/cubit/ranked_game_cubit.dart'
    as _i16;
import 'package:brain_check/features/pages/ranking_page/cubit/ranking_page_cubit.dart'
    as _i17;
import 'package:brain_check/features/pages/result_page/cubit/result_page_cubit.dart'
    as _i8;
import 'package:brain_check/features/pages/root_page/cubit/root_page_cubit.dart'
    as _i9;
import 'package:brain_check/features/pages/set_up_user_page/cubit/set_up_user_cubit.dart'
    as _i10;
import 'package:brain_check/features/pages/user_page/cubit/user_page_cubit.dart'
    as _i11;
import 'package:dio/dio.dart' as _i12;
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
    gh.factory<_i8.ResultPageCubit>(() =>
        _i8.ResultPageCubit(rankingRepository: gh<_i7.RankingRepository>()));
    gh.factory<_i9.RootPageCubit>(
        () => _i9.RootPageCubit(authRepository: gh<_i4.AuthRepository>()));
    gh.factory<_i10.SetUpUserCubit>(() =>
        _i10.SetUpUserCubit(rankingRepository: gh<_i7.RankingRepository>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i11.UserPageCubit>(() => _i11.UserPageCubit(
          authRepository: gh<_i4.AuthRepository>(),
          rankingRepository: gh<_i7.RankingRepository>(),
        ));
    gh.lazySingleton<_i12.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i13.QuestionDataSource>(
        () => _i13.QuestionDataSource(gh<_i12.Dio>()));
    gh.factory<_i14.QuestionRepository>(() => _i14.QuestionRepository(
        questionDataSource: gh<_i13.QuestionDataSource>()));
    gh.factory<_i15.QuestionTestPageCubit>(() => _i15.QuestionTestPageCubit(
          questionRepository: gh<_i14.QuestionRepository>(),
          rankingRepository: gh<_i7.RankingRepository>(),
        ));
    gh.factory<_i16.RankedGameCubit>(() =>
        _i16.RankedGameCubit(rankingRepository: gh<_i7.RankingRepository>()));
    gh.factory<_i17.RankingPageCubit>(() =>
        _i17.RankingPageCubit(rankingRepository: gh<_i7.RankingRepository>()));
    gh.factory<_i18.TokenCubitCubit>(() => _i18.TokenCubitCubit(
        questionRepository: gh<_i14.QuestionRepository>()));
    gh.factory<_i19.CategoriesPageCubit>(() => _i19.CategoriesPageCubit(
        questionRepository: gh<_i14.QuestionRepository>()));
    gh.factory<_i20.DifficultyPageCubit>(() => _i20.DifficultyPageCubit(
        questionRepository: gh<_i14.QuestionRepository>()));
    gh.factory<_i21.HomePageCubit>(() => _i21.HomePageCubit(
          rankingRepository: gh<_i7.RankingRepository>(),
          questionRepository: gh<_i14.QuestionRepository>(),
        ));
    gh.factory<_i22.QuestionPageCubit>(() => _i22.QuestionPageCubit(
          questionRepository: gh<_i14.QuestionRepository>(),
          rankingRepository: gh<_i7.RankingRepository>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i23.RegisterModule {}
