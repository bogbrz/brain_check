// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_score_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlayerScoreState {
  String? get errorMessage => throw _privateConstructorUsedError;
  List<RoundScoreModel>? get playerOneScore =>
      throw _privateConstructorUsedError;
  List<RoundScoreModel>? get playerTwoScore =>
      throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerScoreStateCopyWith<PlayerScoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerScoreStateCopyWith<$Res> {
  factory $PlayerScoreStateCopyWith(
          PlayerScoreState value, $Res Function(PlayerScoreState) then) =
      _$PlayerScoreStateCopyWithImpl<$Res, PlayerScoreState>;
  @useResult
  $Res call(
      {String? errorMessage,
      List<RoundScoreModel>? playerOneScore,
      List<RoundScoreModel>? playerTwoScore,
      Status status});
}

/// @nodoc
class _$PlayerScoreStateCopyWithImpl<$Res, $Val extends PlayerScoreState>
    implements $PlayerScoreStateCopyWith<$Res> {
  _$PlayerScoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? playerOneScore = freezed,
    Object? playerTwoScore = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      playerOneScore: freezed == playerOneScore
          ? _value.playerOneScore
          : playerOneScore // ignore: cast_nullable_to_non_nullable
              as List<RoundScoreModel>?,
      playerTwoScore: freezed == playerTwoScore
          ? _value.playerTwoScore
          : playerTwoScore // ignore: cast_nullable_to_non_nullable
              as List<RoundScoreModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $PlayerScoreStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      List<RoundScoreModel>? playerOneScore,
      List<RoundScoreModel>? playerTwoScore,
      Status status});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PlayerScoreStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? playerOneScore = freezed,
    Object? playerTwoScore = freezed,
    Object? status = null,
  }) {
    return _then(_$InitialImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      playerOneScore: freezed == playerOneScore
          ? _value._playerOneScore
          : playerOneScore // ignore: cast_nullable_to_non_nullable
              as List<RoundScoreModel>?,
      playerTwoScore: freezed == playerTwoScore
          ? _value._playerTwoScore
          : playerTwoScore // ignore: cast_nullable_to_non_nullable
              as List<RoundScoreModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.errorMessage,
      required final List<RoundScoreModel>? playerOneScore,
      required final List<RoundScoreModel>? playerTwoScore,
      required this.status})
      : _playerOneScore = playerOneScore,
        _playerTwoScore = playerTwoScore;

  @override
  final String? errorMessage;
  final List<RoundScoreModel>? _playerOneScore;
  @override
  List<RoundScoreModel>? get playerOneScore {
    final value = _playerOneScore;
    if (value == null) return null;
    if (_playerOneScore is EqualUnmodifiableListView) return _playerOneScore;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RoundScoreModel>? _playerTwoScore;
  @override
  List<RoundScoreModel>? get playerTwoScore {
    final value = _playerTwoScore;
    if (value == null) return null;
    if (_playerTwoScore is EqualUnmodifiableListView) return _playerTwoScore;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Status status;

  @override
  String toString() {
    return 'PlayerScoreState(errorMessage: $errorMessage, playerOneScore: $playerOneScore, playerTwoScore: $playerTwoScore, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._playerOneScore, _playerOneScore) &&
            const DeepCollectionEquality()
                .equals(other._playerTwoScore, _playerTwoScore) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorMessage,
      const DeepCollectionEquality().hash(_playerOneScore),
      const DeepCollectionEquality().hash(_playerTwoScore),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements PlayerScoreState {
  const factory _Initial(
      {required final String? errorMessage,
      required final List<RoundScoreModel>? playerOneScore,
      required final List<RoundScoreModel>? playerTwoScore,
      required final Status status}) = _$InitialImpl;

  @override
  String? get errorMessage;
  @override
  List<RoundScoreModel>? get playerOneScore;
  @override
  List<RoundScoreModel>? get playerTwoScore;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
