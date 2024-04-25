// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../question_page_route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuestionPageRouteModel {
  User get user => throw _privateConstructorUsedError;
  ProfileModel get profileModel => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  int get questionAmount => throw _privateConstructorUsedError;
  String? get difficulty => throw _privateConstructorUsedError;
  GameType get gameType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionPageRouteModelCopyWith<QuestionPageRouteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionPageRouteModelCopyWith<$Res> {
  factory $QuestionPageRouteModelCopyWith(QuestionPageRouteModel value,
          $Res Function(QuestionPageRouteModel) then) =
      _$QuestionPageRouteModelCopyWithImpl<$Res, QuestionPageRouteModel>;
  @useResult
  $Res call(
      {User user,
      ProfileModel profileModel,
      int? categoryId,
      int questionAmount,
      String? difficulty,
      GameType gameType});

  $ProfileModelCopyWith<$Res> get profileModel;
}

/// @nodoc
class _$QuestionPageRouteModelCopyWithImpl<$Res,
        $Val extends QuestionPageRouteModel>
    implements $QuestionPageRouteModelCopyWith<$Res> {
  _$QuestionPageRouteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? profileModel = null,
    Object? categoryId = freezed,
    Object? questionAmount = null,
    Object? difficulty = freezed,
    Object? gameType = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      profileModel: null == profileModel
          ? _value.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionAmount: null == questionAmount
          ? _value.questionAmount
          : questionAmount // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as GameType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profileModel {
    return $ProfileModelCopyWith<$Res>(_value.profileModel, (value) {
      return _then(_value.copyWith(profileModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuestionPageRouteModelImplCopyWith<$Res>
    implements $QuestionPageRouteModelCopyWith<$Res> {
  factory _$$QuestionPageRouteModelImplCopyWith(
          _$QuestionPageRouteModelImpl value,
          $Res Function(_$QuestionPageRouteModelImpl) then) =
      __$$QuestionPageRouteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      ProfileModel profileModel,
      int? categoryId,
      int questionAmount,
      String? difficulty,
      GameType gameType});

  @override
  $ProfileModelCopyWith<$Res> get profileModel;
}

/// @nodoc
class __$$QuestionPageRouteModelImplCopyWithImpl<$Res>
    extends _$QuestionPageRouteModelCopyWithImpl<$Res,
        _$QuestionPageRouteModelImpl>
    implements _$$QuestionPageRouteModelImplCopyWith<$Res> {
  __$$QuestionPageRouteModelImplCopyWithImpl(
      _$QuestionPageRouteModelImpl _value,
      $Res Function(_$QuestionPageRouteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? profileModel = null,
    Object? categoryId = freezed,
    Object? questionAmount = null,
    Object? difficulty = freezed,
    Object? gameType = null,
  }) {
    return _then(_$QuestionPageRouteModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      profileModel: null == profileModel
          ? _value.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionAmount: null == questionAmount
          ? _value.questionAmount
          : questionAmount // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as GameType,
    ));
  }
}

/// @nodoc

class _$QuestionPageRouteModelImpl implements _QuestionPageRouteModel {
  _$QuestionPageRouteModelImpl(
      {required this.user,
      required this.profileModel,
      required this.categoryId,
      required this.questionAmount,
      required this.difficulty,
      required this.gameType});

  @override
  final User user;
  @override
  final ProfileModel profileModel;
  @override
  final int? categoryId;
  @override
  final int questionAmount;
  @override
  final String? difficulty;
  @override
  final GameType gameType;

  @override
  String toString() {
    return 'QuestionPageRouteModel(user: $user, profileModel: $profileModel, categoryId: $categoryId, questionAmount: $questionAmount, difficulty: $difficulty, gameType: $gameType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionPageRouteModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.profileModel, profileModel) ||
                other.profileModel == profileModel) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.questionAmount, questionAmount) ||
                other.questionAmount == questionAmount) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, profileModel, categoryId,
      questionAmount, difficulty, gameType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionPageRouteModelImplCopyWith<_$QuestionPageRouteModelImpl>
      get copyWith => __$$QuestionPageRouteModelImplCopyWithImpl<
          _$QuestionPageRouteModelImpl>(this, _$identity);
}

abstract class _QuestionPageRouteModel implements QuestionPageRouteModel {
  factory _QuestionPageRouteModel(
      {required final User user,
      required final ProfileModel profileModel,
      required final int? categoryId,
      required final int questionAmount,
      required final String? difficulty,
      required final GameType gameType}) = _$QuestionPageRouteModelImpl;

  @override
  User get user;
  @override
  ProfileModel get profileModel;
  @override
  int? get categoryId;
  @override
  int get questionAmount;
  @override
  String? get difficulty;
  @override
  GameType get gameType;
  @override
  @JsonKey(ignore: true)
  _$$QuestionPageRouteModelImplCopyWith<_$QuestionPageRouteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
