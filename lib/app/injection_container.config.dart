// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:brain_check/app/injection_container.dart' as _i29;
import 'package:brain_check/data_sources/authentication_data_source.dart'
    as _i3;
import 'package:brain_check/data_sources/duel_game_data_source.dart' as _i5;
import 'package:brain_check/data_sources/questions_data_source.dart' as _i14;
import 'package:brain_check/data_sources/ranking_data_source.dart' as _i7;
import 'package:brain_check/data_sources/storage_data_source.dart' as _i10;
import 'package:brain_check/domain/repositories/authentication_repository.dart'
    as _i4;
import 'package:brain_check/domain/repositories/duel_game_repository.dart'
    as _i21;
import 'package:brain_check/domain/repositories/questions_repository.dart'
    as _i15;
import 'package:brain_check/domain/repositories/ranking_repository.dart' as _i8;
import 'package:brain_check/domain/repositories/storage_repository.dart'
    as _i11;
import 'package:brain_check/features/pages/categories_page/cubit/categories_page_cubit.dart'
    as _i19;
import 'package:brain_check/features/pages/difficulty_page/cubit/difficulty_page_cubit.dart'
    as _i20;
import 'package:brain_check/features/pages/duel_question_page/cubit/duel_question_page_cubit.dart'
    as _i22;
import 'package:brain_check/features/pages/duel_result_page/cubit/duel_result_cubit.dart'
    as _i23;
import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart'
    as _i24;
import 'package:brain_check/features/pages/duel_room_page/widgets/cubit/player_score_cubit.dart'
    as _i26;
import 'package:brain_check/features/pages/home_page/cubit/home_page_cubit.dart'
    as _i25;
import 'package:brain_check/features/pages/log_in/cubit/log_in_page_cubit.dart'
    as _i6;
import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart'
    as _i27;
import 'package:brain_check/features/pages/ranked_game_page/cubit/ranked_game_cubit.dart'
    as _i16;
import 'package:brain_check/features/pages/ranking_page/cubit/ranking_page_cubit.dart'
    as _i17;
import 'package:brain_check/features/pages/rooms_list_page/cubit/rooms_list_page_cubit.dart'
    as _i28;
import 'package:brain_check/features/pages/root_page/cubit/root_page_cubit.dart'
    as _i9;
import 'package:brain_check/features/pages/set_up_user_page/cubit/set_up_user_cubit.dart'
    as _i18;
import 'package:brain_check/features/pages/user_page/cubit/user_page_cubit.dart'
    as _i12;
import 'package:dio/dio.dart' as _i13;
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
    gh.factory<_i5.DuelGameDataSource>(() => _i5.DuelGameDataSource());
    gh.factory<_i6.LogInPageCubit>(
        () => _i6.LogInPageCubit(authRepository: gh<_i4.AuthRepository>()));
    gh.factory<_i7.RankingFireBaseDataSource>(
        () => _i7.RankingFireBaseDataSource());
    gh.factory<_i8.RankingRepository>(() => _i8.RankingRepository(
        rankingFireBaseDataSource: gh<_i7.RankingFireBaseDataSource>()));
    gh.factory<_i9.RootPageCubit>(
        () => _i9.RootPageCubit(authRepository: gh<_i4.AuthRepository>()));
    gh.factory<_i10.StorageDataSource>(() => _i10.StorageDataSource());
    gh.factory<_i11.StorageRepository>(() => _i11.StorageRepository(
        storageDataSource: gh<_i10.StorageDataSource>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i12.UserPageCubit>(() => _i12.UserPageCubit(
          authRepository: gh<_i4.AuthRepository>(),
          rankingRepository: gh<_i8.RankingRepository>(),
          storageRepository: gh<_i11.StorageRepository>(),
        ));
    gh.lazySingleton<_i13.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i14.QuestionDataSource>(
        () => _i14.QuestionDataSource(gh<_i13.Dio>()));
    gh.factory<_i15.QuestionRepository>(() => _i15.QuestionRepository(
        questionDataSource: gh<_i14.QuestionDataSource>()));
    gh.factory<_i16.RankedGameCubit>(() => _i16.RankedGameCubit(
          rankingRepository: gh<_i8.RankingRepository>(),
          questionRepository: gh<_i15.QuestionRepository>(),
        ));
    gh.factory<_i17.RankingPageCubit>(() =>
        _i17.RankingPageCubit(rankingRepository: gh<_i8.RankingRepository>()));
    gh.factory<_i18.SetUpUserCubit>(() => _i18.SetUpUserCubit(
          rankingRepository: gh<_i8.RankingRepository>(),
          storageRepository: gh<_i11.StorageRepository>(),
        ));
    gh.factory<_i19.CategoriesPageCubit>(() => _i19.CategoriesPageCubit(
        questionRepository: gh<_i15.QuestionRepository>()));
    gh.factory<_i20.DifficultyPageCubit>(() => _i20.DifficultyPageCubit(
          questionRepository: gh<_i15.QuestionRepository>(),
          rankingRepository: gh<_i8.RankingRepository>(),
        ));
    gh.factory<_i21.DuelGameRepository>(() => _i21.DuelGameRepository(
          duelGameDataSource: gh<_i5.DuelGameDataSource>(),
          questionDataSource: gh<_i14.QuestionDataSource>(),
        ));
    gh.factory<_i22.DuelQuestionPageCubit>(() => _i22.DuelQuestionPageCubit(
        duelGameRepository: gh<_i21.DuelGameRepository>()));
    gh.factory<_i23.DuelResultCubit>(() => _i23.DuelResultCubit(
          duelGameRepository: gh<_i21.DuelGameRepository>(),
          rankingRepository: gh<_i8.RankingRepository>(),
        ));
    gh.factory<_i24.DuelRoomPageCubit>(() => _i24.DuelRoomPageCubit(
          duelGameRepository: gh<_i21.DuelGameRepository>(),
          questionRepository: gh<_i15.QuestionRepository>(),
        ));
    gh.factory<_i25.HomePageCubit>(() => _i25.HomePageCubit(
          rankingRepository: gh<_i8.RankingRepository>(),
          questionRepository: gh<_i15.QuestionRepository>(),
          storageRepository: gh<_i11.StorageRepository>(),
        ));
    gh.factory<_i26.PlayerScoreCubit>(() => _i26.PlayerScoreCubit(
        duelGameRepository: gh<_i21.DuelGameRepository>()));
    gh.factory<_i27.QuestionPageCubit>(() => _i27.QuestionPageCubit(
          questionRepository: gh<_i15.QuestionRepository>(),
          rankingRepository: gh<_i8.RankingRepository>(),
          duelGameRepository: gh<_i21.DuelGameRepository>(),
        ));
    gh.factory<_i28.RoomsListPageCubit>(() => _i28.RoomsListPageCubit(
        duelGameRepository: gh<_i21.DuelGameRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i29.RegisterModule {}
