// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../duel_result_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DuelResultState {
  String? get errorMessage => throw _privateConstructorUsedError;
  List<ProfileModel> get profiles => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get gameLenght => throw _privateConstructorUsedError;
  Duration? get gameDuration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DuelResultStateCopyWith<DuelResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DuelResultStateCopyWith<$Res> {
  factory $DuelResultStateCopyWith(
          DuelResultState value, $Res Function(DuelResultState) then) =
      _$DuelResultStateCopyWithImpl<$Res, DuelResultState>;
  @useResult
  $Res call(
      {String? errorMessage,
      List<ProfileModel> profiles,
      Status status,
      String? gameLenght,
      Duration? gameDuration});
}

/// @nodoc
class _$DuelResultStateCopyWithImpl<$Res, $Val extends DuelResultState>
    implements $DuelResultStateCopyWith<$Res> {
  _$DuelResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? profiles = null,
    Object? status = null,
    Object? gameLenght = freezed,
    Object? gameDuration = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      profiles: null == profiles
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<ProfileModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      gameLenght: freezed == gameLenght
          ? _value.gameLenght
          : gameLenght // ignore: cast_nullable_to_non_nullable
              as String?,
      gameDuration: freezed == gameDuration
          ? _value.gameDuration
          : gameDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $DuelResultStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      List<ProfileModel> profiles,
      Status status,
      String? gameLenght,
      Duration? gameDuration});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DuelResultStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? profiles = null,
    Object? status = null,
    Object? gameLenght = freezed,
    Object? gameDuration = freezed,
  }) {
    return _then(_$InitialImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      profiles: null == profiles
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<ProfileModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      gameLenght: freezed == gameLenght
          ? _value.gameLenght
          : gameLenght // ignore: cast_nullable_to_non_nullable
              as String?,
      gameDuration: freezed == gameDuration
          ? _value.gameDuration
          : gameDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.errorMessage,
      required final List<ProfileModel> profiles,
      required this.status,
      required this.gameLenght,
      required this.gameDuration})
      : _profiles = profiles;

  @override
  final String? errorMessage;
  final List<ProfileModel> _profiles;
  @override
  List<ProfileModel> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  @override
  final Status status;
  @override
  final String? gameLenght;
  @override
  final Duration? gameDuration;

  @override
  String toString() {
    return 'DuelResultState(errorMessage: $errorMessage, profiles: $profiles, status: $status, gameLenght: $gameLenght, gameDuration: $gameDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gameLenght, gameLenght) ||
                other.gameLenght == gameLenght) &&
            (identical(other.gameDuration, gameDuration) ||
                other.gameDuration == gameDuration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorMessage,
      const DeepCollectionEquality().hash(_profiles),
      status,
      gameLenght,
      gameDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements DuelResultState {
  const factory _Initial(
      {required final String? errorMessage,
      required final List<ProfileModel> profiles,
      required final Status status,
      required final String? gameLenght,
      required final Duration? gameDuration}) = _$InitialImpl;

  @override
  String? get errorMessage;
  @override
  List<ProfileModel> get profiles;
  @override
  Status get status;
  @override
  String? get gameLenght;
  @override
  Duration? get gameDuration;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
