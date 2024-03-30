// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoomStatusModel {
  bool get startGame => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomStatusModelCopyWith<RoomStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStatusModelCopyWith<$Res> {
  factory $RoomStatusModelCopyWith(
          RoomStatusModel value, $Res Function(RoomStatusModel) then) =
      _$RoomStatusModelCopyWithImpl<$Res, RoomStatusModel>;
  @useResult
  $Res call({bool startGame, String id});
}

/// @nodoc
class _$RoomStatusModelCopyWithImpl<$Res, $Val extends RoomStatusModel>
    implements $RoomStatusModelCopyWith<$Res> {
  _$RoomStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startGame = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      startGame: null == startGame
          ? _value.startGame
          : startGame // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomStatusModelImplCopyWith<$Res>
    implements $RoomStatusModelCopyWith<$Res> {
  factory _$$RoomStatusModelImplCopyWith(_$RoomStatusModelImpl value,
          $Res Function(_$RoomStatusModelImpl) then) =
      __$$RoomStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool startGame, String id});
}

/// @nodoc
class __$$RoomStatusModelImplCopyWithImpl<$Res>
    extends _$RoomStatusModelCopyWithImpl<$Res, _$RoomStatusModelImpl>
    implements _$$RoomStatusModelImplCopyWith<$Res> {
  __$$RoomStatusModelImplCopyWithImpl(
      _$RoomStatusModelImpl _value, $Res Function(_$RoomStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startGame = null,
    Object? id = null,
  }) {
    return _then(_$RoomStatusModelImpl(
      startGame: null == startGame
          ? _value.startGame
          : startGame // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RoomStatusModelImpl implements _RoomStatusModel {
  _$RoomStatusModelImpl({required this.startGame, required this.id});

  @override
  final bool startGame;
  @override
  final String id;

  @override
  String toString() {
    return 'RoomStatusModel(startGame: $startGame, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomStatusModelImpl &&
            (identical(other.startGame, startGame) ||
                other.startGame == startGame) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startGame, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomStatusModelImplCopyWith<_$RoomStatusModelImpl> get copyWith =>
      __$$RoomStatusModelImplCopyWithImpl<_$RoomStatusModelImpl>(
          this, _$identity);
}

abstract class _RoomStatusModel implements RoomStatusModel {
  factory _RoomStatusModel(
      {required final bool startGame,
      required final String id}) = _$RoomStatusModelImpl;

  @override
  bool get startGame;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$RoomStatusModelImplCopyWith<_$RoomStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
