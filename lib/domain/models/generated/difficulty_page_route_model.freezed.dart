// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../difficulty_page_route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DifficultyRouteModel {
  User get user => throw _privateConstructorUsedError;
  ProfileModel get profileModel => throw _privateConstructorUsedError;
  TriviaCategory get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DifficultyRouteModelCopyWith<DifficultyRouteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DifficultyRouteModelCopyWith<$Res> {
  factory $DifficultyRouteModelCopyWith(DifficultyRouteModel value,
          $Res Function(DifficultyRouteModel) then) =
      _$DifficultyRouteModelCopyWithImpl<$Res, DifficultyRouteModel>;
  @useResult
  $Res call({User user, ProfileModel profileModel, TriviaCategory category});

  $ProfileModelCopyWith<$Res> get profileModel;
  $TriviaCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$DifficultyRouteModelCopyWithImpl<$Res,
        $Val extends DifficultyRouteModel>
    implements $DifficultyRouteModelCopyWith<$Res> {
  _$DifficultyRouteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? profileModel = null,
    Object? category = null,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TriviaCategory,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profileModel {
    return $ProfileModelCopyWith<$Res>(_value.profileModel, (value) {
      return _then(_value.copyWith(profileModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TriviaCategoryCopyWith<$Res> get category {
    return $TriviaCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DifficultyRouteModelImplCopyWith<$Res>
    implements $DifficultyRouteModelCopyWith<$Res> {
  factory _$$DifficultyRouteModelImplCopyWith(_$DifficultyRouteModelImpl value,
          $Res Function(_$DifficultyRouteModelImpl) then) =
      __$$DifficultyRouteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, ProfileModel profileModel, TriviaCategory category});

  @override
  $ProfileModelCopyWith<$Res> get profileModel;
  @override
  $TriviaCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$DifficultyRouteModelImplCopyWithImpl<$Res>
    extends _$DifficultyRouteModelCopyWithImpl<$Res, _$DifficultyRouteModelImpl>
    implements _$$DifficultyRouteModelImplCopyWith<$Res> {
  __$$DifficultyRouteModelImplCopyWithImpl(_$DifficultyRouteModelImpl _value,
      $Res Function(_$DifficultyRouteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? profileModel = null,
    Object? category = null,
  }) {
    return _then(_$DifficultyRouteModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      profileModel: null == profileModel
          ? _value.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TriviaCategory,
    ));
  }
}

/// @nodoc

class _$DifficultyRouteModelImpl implements _DifficultyRouteModel {
  _$DifficultyRouteModelImpl(
      {required this.user, required this.profileModel, required this.category});

  @override
  final User user;
  @override
  final ProfileModel profileModel;
  @override
  final TriviaCategory category;

  @override
  String toString() {
    return 'DifficultyRouteModel(user: $user, profileModel: $profileModel, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DifficultyRouteModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.profileModel, profileModel) ||
                other.profileModel == profileModel) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, profileModel, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DifficultyRouteModelImplCopyWith<_$DifficultyRouteModelImpl>
      get copyWith =>
          __$$DifficultyRouteModelImplCopyWithImpl<_$DifficultyRouteModelImpl>(
              this, _$identity);
}

abstract class _DifficultyRouteModel implements DifficultyRouteModel {
  factory _DifficultyRouteModel(
      {required final User user,
      required final ProfileModel profileModel,
      required final TriviaCategory category}) = _$DifficultyRouteModelImpl;

  @override
  User get user;
  @override
  ProfileModel get profileModel;
  @override
  TriviaCategory get category;
  @override
  @JsonKey(ignore: true)
  _$$DifficultyRouteModelImplCopyWith<_$DifficultyRouteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
