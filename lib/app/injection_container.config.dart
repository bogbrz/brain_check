// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:brain_check/app/injection_container.dart' as _i28;
import 'package:brain_check/data_sources/authentication_data_source.dart'
    as _i3;
import 'package:brain_check/data_sources/duel_game_data_source.dart' as _i5;
import 'package:brain_check/data_sources/questions_data_source.dart' as _i11;
import 'package:brain_check/data_sources/ranking_data_source.dart' as _i7;
import 'package:brain_check/data_sources/storage_data_source.dart' as _i8;
import 'package:brain_check/domain/repositories/authentication_repository.dart'
    as _i4;
import 'package:brain_check/domain/repositories/duel_game_repository.dart'
    as _i18;
import 'package:brain_check/domain/repositories/questions_repository.dart'
    as _i12;
import 'package:brain_check/domain/repositories/ranking_repository.dart'
    as _i13;
import 'package:brain_check/domain/repositories/storage_repository.dart' as _i9;
import 'package:brain_check/features/pages/categories_page/cubit/categories_page_cubit.dart'
    as _i16;
import 'package:brain_check/features/pages/difficulty_page/cubit/difficulty_page_cubit.dart'
    as _i17;
import 'package:brain_check/features/pages/duel_question_page/cubit/duel_question_page_cubit.dart'
    as _i19;
import 'package:brain_check/features/pages/duel_room_page/cubit/duel_room_page_cubit.dart'
    as _i20;
import 'package:brain_check/features/pages/duel_room_page/widgets/cubit/player_score_cubit.dart'
    as _i22;
import 'package:brain_check/features/pages/home_page/cubit/home_page_cubit.dart'
    as _i21;
import 'package:brain_check/features/pages/log_in/cubit/log_in_page_cubit.dart'
    as _i6;
import 'package:brain_check/features/pages/question_page/cubit/question_page_cubit.dart'
    as _i23;
import 'package:brain_check/features/pages/ranked_game_page/cubit/ranked_game_cubit.dart'
    as _i24;
import 'package:brain_check/features/pages/ranking_page/cubit/ranking_page_cubit.dart'
    as _i25;
import 'package:brain_check/features/pages/result_page/cubit/result_cubit.dart'
    as _i26;
import 'package:brain_check/features/pages/rooms_list_page/cubit/rooms_list_page_cubit.dart'
    as _i27;
import 'package:brain_check/features/pages/set_up_user_page/cubit/set_up_user_cubit.dart'
    as _i14;
import 'package:brain_check/features/pages/user_page/cubit/user_page_cubit.dart'
    as _i15;
import 'package:dio/dio.dart' as _i10;
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
    gh.factory<_i8.StorageDataSource>(() => _i8.StorageDataSource());
    gh.factory<_i9.StorageRepository>(() =>
        _i9.StorageRepository(storageDataSource: gh<_i8.StorageDataSource>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i10.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i11.QuestionDataSource>(
        () => _i11.QuestionDataSource(gh<_i10.Dio>()));
    gh.factory<_i12.QuestionRepository>(() => _i12.QuestionRepository(
        questionDataSource: gh<_i11.QuestionDataSource>()));
    gh.factory<_i13.RankingRepository>(() => _i13.RankingRepository(
          rankingFireBaseDataSource: gh<_i7.RankingFireBaseDataSource>(),
          storageDataSource: gh<_i8.StorageDataSource>(),
        ));
    gh.factory<_i14.SetUpUserCubit>(() => _i14.SetUpUserCubit(
          rankingRepository: gh<_i13.RankingRepository>(),
          storageRepository: gh<_i9.StorageRepository>(),
        ));
    gh.factory<_i15.UserPageCubit>(() => _i15.UserPageCubit(
          authRepository: gh<_i4.AuthRepository>(),
          rankingRepository: gh<_i13.RankingRepository>(),
          storageRepository: gh<_i9.StorageRepository>(),
        ));
    gh.factory<_i16.CategoriesPageCubit>(() => _i16.CategoriesPageCubit(
        questionRepository: gh<_i12.QuestionRepository>()));
    gh.factory<_i17.DifficultyPageCubit>(() => _i17.DifficultyPageCubit(
          questionRepository: gh<_i12.QuestionRepository>(),
          rankingRepository: gh<_i13.RankingRepository>(),
        ));
    gh.factory<_i18.DuelGameRepository>(() => _i18.DuelGameRepository(
          duelGameDataSource: gh<_i5.DuelGameDataSource>(),
          questionDataSource: gh<_i11.QuestionDataSource>(),
        ));
    gh.factory<_i19.DuelQuestionPageCubit>(() => _i19.DuelQuestionPageCubit(
        duelGameRepository: gh<_i18.DuelGameRepository>()));
    gh.factory<_i20.DuelRoomPageCubit>(() => _i20.DuelRoomPageCubit(
          duelGameRepository: gh<_i18.DuelGameRepository>(),
          questionRepository: gh<_i12.QuestionRepository>(),
        ));
    gh.factory<_i21.HomePageCubit>(() => _i21.HomePageCubit(
          rankingRepository: gh<_i13.RankingRepository>(),
          questionRepository: gh<_i12.QuestionRepository>(),
          storageRepository: gh<_i9.StorageRepository>(),
        ));
    gh.factory<_i22.PlayerScoreCubit>(() => _i22.PlayerScoreCubit(
        duelGameRepository: gh<_i18.DuelGameRepository>()));
    gh.factory<_i23.QuestionPageCubit>(() => _i23.QuestionPageCubit(
          questionRepository: gh<_i12.QuestionRepository>(),
          rankingRepository: gh<_i13.RankingRepository>(),
          duelGameRepository: gh<_i18.DuelGameRepository>(),
        ));
    gh.factory<_i24.RankedGameCubit>(() => _i24.RankedGameCubit(
          rankingRepository: gh<_i13.RankingRepository>(),
          questionRepository: gh<_i12.QuestionRepository>(),
        ));
    gh.factory<_i25.RankingPageCubit>(() =>
        _i25.RankingPageCubit(rankingRepository: gh<_i13.RankingRepository>()));
    gh.factory<_i26.ResultCubit>(() => _i26.ResultCubit(
          duelGameRepository: gh<_i18.DuelGameRepository>(),
          rankingRepository: gh<_i13.RankingRepository>(),
        ));
    gh.factory<_i27.RoomsListPageCubit>(() => _i27.RoomsListPageCubit(
        duelGameRepository: gh<_i18.DuelGameRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i28.RegisterModule {}
