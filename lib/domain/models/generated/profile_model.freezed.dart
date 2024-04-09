// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileModel {
  String get email => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get gamesPlayed => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get lifes => throw _privateConstructorUsedError;
  Timestamp get lastLogIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call(
      {String email,
      String nickName,
      int points,
      int gamesPlayed,
      String id,
      int lifes,
      Timestamp lastLogIn});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? nickName = null,
    Object? points = null,
    Object? gamesPlayed = null,
    Object? id = null,
    Object? lifes = null,
    Object? lastLogIn = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      gamesPlayed: null == gamesPlayed
          ? _value.gamesPlayed
          : gamesPlayed // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lifes: null == lifes
          ? _value.lifes
          : lifes // ignore: cast_nullable_to_non_nullable
              as int,
      lastLogIn: null == lastLogIn
          ? _value.lastLogIn
          : lastLogIn // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
          _$ProfileModelImpl value, $Res Function(_$ProfileModelImpl) then) =
      __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String nickName,
      int points,
      int gamesPlayed,
      String id,
      int lifes,
      Timestamp lastLogIn});
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
      _$ProfileModelImpl _value, $Res Function(_$ProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? nickName = null,
    Object? points = null,
    Object? gamesPlayed = null,
    Object? id = null,
    Object? lifes = null,
    Object? lastLogIn = null,
  }) {
    return _then(_$ProfileModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      gamesPlayed: null == gamesPlayed
          ? _value.gamesPlayed
          : gamesPlayed // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lifes: null == lifes
          ? _value.lifes
          : lifes // ignore: cast_nullable_to_non_nullable
              as int,
      lastLogIn: null == lastLogIn
          ? _value.lastLogIn
          : lastLogIn // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc

class _$ProfileModelImpl implements _ProfileModel {
  _$ProfileModelImpl(
      {required this.email,
      required this.nickName,
      required this.points,
      required this.gamesPlayed,
      required this.id,
      required this.lifes,
      required this.lastLogIn});

  @override
  final String email;
  @override
  final String nickName;
  @override
  final int points;
  @override
  final int gamesPlayed;
  @override
  final String id;
  @override
  final int lifes;
  @override
  final Timestamp lastLogIn;

  @override
  String toString() {
    return 'ProfileModel(email: $email, nickName: $nickName, points: $points, gamesPlayed: $gamesPlayed, id: $id, lifes: $lifes, lastLogIn: $lastLogIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.gamesPlayed, gamesPlayed) ||
                other.gamesPlayed == gamesPlayed) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lifes, lifes) || other.lifes == lifes) &&
            (identical(other.lastLogIn, lastLogIn) ||
                other.lastLogIn == lastLogIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, email, nickName, points, gamesPlayed, id, lifes, lastLogIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);
}

abstract class _ProfileModel implements ProfileModel {
  factory _ProfileModel(
      {required final String email,
      required final String nickName,
      required final int points,
      required final int gamesPlayed,
      required final String id,
      required final int lifes,
      required final Timestamp lastLogIn}) = _$ProfileModelImpl;

  @override
  String get email;
  @override
  String get nickName;
  @override
  int get points;
  @override
  int get gamesPlayed;
  @override
  String get id;
  @override
  int get lifes;
  @override
  Timestamp get lastLogIn;
  @override
  @JsonKey(ignore: true)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
