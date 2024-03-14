// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameRoomModel {
  String get name => throw _privateConstructorUsedError;
  String get ownerMail => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  int get playersAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameRoomModelCopyWith<GameRoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRoomModelCopyWith<$Res> {
  factory $GameRoomModelCopyWith(
          GameRoomModel value, $Res Function(GameRoomModel) then) =
      _$GameRoomModelCopyWithImpl<$Res, GameRoomModel>;
  @useResult
  $Res call(
      {String name,
      String ownerMail,
      String password,
      String id,
      String nickName,
      int playersAmount});
}

/// @nodoc
class _$GameRoomModelCopyWithImpl<$Res, $Val extends GameRoomModel>
    implements $GameRoomModelCopyWith<$Res> {
  _$GameRoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ownerMail = null,
    Object? password = null,
    Object? id = null,
    Object? nickName = null,
    Object? playersAmount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerMail: null == ownerMail
          ? _value.ownerMail
          : ownerMail // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      playersAmount: null == playersAmount
          ? _value.playersAmount
          : playersAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameRoomModelImplCopyWith<$Res>
    implements $GameRoomModelCopyWith<$Res> {
  factory _$$GameRoomModelImplCopyWith(
          _$GameRoomModelImpl value, $Res Function(_$GameRoomModelImpl) then) =
      __$$GameRoomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String ownerMail,
      String password,
      String id,
      String nickName,
      int playersAmount});
}

/// @nodoc
class __$$GameRoomModelImplCopyWithImpl<$Res>
    extends _$GameRoomModelCopyWithImpl<$Res, _$GameRoomModelImpl>
    implements _$$GameRoomModelImplCopyWith<$Res> {
  __$$GameRoomModelImplCopyWithImpl(
      _$GameRoomModelImpl _value, $Res Function(_$GameRoomModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ownerMail = null,
    Object? password = null,
    Object? id = null,
    Object? nickName = null,
    Object? playersAmount = null,
  }) {
    return _then(_$GameRoomModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerMail: null == ownerMail
          ? _value.ownerMail
          : ownerMail // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      playersAmount: null == playersAmount
          ? _value.playersAmount
          : playersAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GameRoomModelImpl implements _GameRoomModel {
  _$GameRoomModelImpl(
      {required this.name,
      required this.ownerMail,
      required this.password,
      required this.id,
      required this.nickName,
      required this.playersAmount});

  @override
  final String name;
  @override
  final String ownerMail;
  @override
  final String password;
  @override
  final String id;
  @override
  final String nickName;
  @override
  final int playersAmount;

  @override
  String toString() {
    return 'GameRoomModel(name: $name, ownerMail: $ownerMail, password: $password, id: $id, nickName: $nickName, playersAmount: $playersAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameRoomModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerMail, ownerMail) ||
                other.ownerMail == ownerMail) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.playersAmount, playersAmount) ||
                other.playersAmount == playersAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, ownerMail, password, id, nickName, playersAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameRoomModelImplCopyWith<_$GameRoomModelImpl> get copyWith =>
      __$$GameRoomModelImplCopyWithImpl<_$GameRoomModelImpl>(this, _$identity);
}

abstract class _GameRoomModel implements GameRoomModel {
  factory _GameRoomModel(
      {required final String name,
      required final String ownerMail,
      required final String password,
      required final String id,
      required final String nickName,
      required final int playersAmount}) = _$GameRoomModelImpl;

  @override
  String get name;
  @override
  String get ownerMail;
  @override
  String get password;
  @override
  String get id;
  @override
  String get nickName;
  @override
  int get playersAmount;
  @override
  @JsonKey(ignore: true)
  _$$GameRoomModelImplCopyWith<_$GameRoomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
