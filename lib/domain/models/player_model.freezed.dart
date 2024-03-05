// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerModel {
  String get email => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get player => throw _privateConstructorUsedError;
  bool get ready => throw _privateConstructorUsedError;
  bool get startGame => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerModelCopyWith<PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerModelCopyWith<$Res> {
  factory $PlayerModelCopyWith(
          PlayerModel value, $Res Function(PlayerModel) then) =
      _$PlayerModelCopyWithImpl<$Res, PlayerModel>;
  @useResult
  $Res call(
      {String email,
      String nickName,
      int points,
      String id,
      int player,
      bool ready,
      bool startGame});
}

/// @nodoc
class _$PlayerModelCopyWithImpl<$Res, $Val extends PlayerModel>
    implements $PlayerModelCopyWith<$Res> {
  _$PlayerModelCopyWithImpl(this._value, this._then);

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
    Object? id = null,
    Object? player = null,
    Object? ready = null,
    Object? startGame = null,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as int,
      ready: null == ready
          ? _value.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as bool,
      startGame: null == startGame
          ? _value.startGame
          : startGame // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerModelImplCopyWith<$Res>
    implements $PlayerModelCopyWith<$Res> {
  factory _$$PlayerModelImplCopyWith(
          _$PlayerModelImpl value, $Res Function(_$PlayerModelImpl) then) =
      __$$PlayerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String nickName,
      int points,
      String id,
      int player,
      bool ready,
      bool startGame});
}

/// @nodoc
class __$$PlayerModelImplCopyWithImpl<$Res>
    extends _$PlayerModelCopyWithImpl<$Res, _$PlayerModelImpl>
    implements _$$PlayerModelImplCopyWith<$Res> {
  __$$PlayerModelImplCopyWithImpl(
      _$PlayerModelImpl _value, $Res Function(_$PlayerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? nickName = null,
    Object? points = null,
    Object? id = null,
    Object? player = null,
    Object? ready = null,
    Object? startGame = null,
  }) {
    return _then(_$PlayerModelImpl(
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as int,
      ready: null == ready
          ? _value.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as bool,
      startGame: null == startGame
          ? _value.startGame
          : startGame // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlayerModelImpl implements _PlayerModel {
  _$PlayerModelImpl(
      {required this.email,
      required this.nickName,
      required this.points,
      required this.id,
      required this.player,
      required this.ready,
      required this.startGame});

  @override
  final String email;
  @override
  final String nickName;
  @override
  final int points;
  @override
  final String id;
  @override
  final int player;
  @override
  final bool ready;
  @override
  final bool startGame;

  @override
  String toString() {
    return 'PlayerModel(email: $email, nickName: $nickName, points: $points, id: $id, player: $player, ready: $ready, startGame: $startGame)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.ready, ready) || other.ready == ready) &&
            (identical(other.startGame, startGame) ||
                other.startGame == startGame));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, email, nickName, points, id, player, ready, startGame);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerModelImplCopyWith<_$PlayerModelImpl> get copyWith =>
      __$$PlayerModelImplCopyWithImpl<_$PlayerModelImpl>(this, _$identity);
}

abstract class _PlayerModel implements PlayerModel {
  factory _PlayerModel(
      {required final String email,
      required final String nickName,
      required final int points,
      required final String id,
      required final int player,
      required final bool ready,
      required final bool startGame}) = _$PlayerModelImpl;

  @override
  String get email;
  @override
  String get nickName;
  @override
  int get points;
  @override
  String get id;
  @override
  int get player;
  @override
  bool get ready;
  @override
  bool get startGame;
  @override
  @JsonKey(ignore: true)
  _$$PlayerModelImplCopyWith<_$PlayerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
