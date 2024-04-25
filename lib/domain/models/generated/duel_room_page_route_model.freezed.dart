// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../duel_room_page_route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DuelRoomRoutePageModel {
  User? get user => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String? get userPicture => throw _privateConstructorUsedError;
  GameRoomModel get roomModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DuelRoomRoutePageModelCopyWith<DuelRoomRoutePageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DuelRoomRoutePageModelCopyWith<$Res> {
  factory $DuelRoomRoutePageModelCopyWith(DuelRoomRoutePageModel value,
          $Res Function(DuelRoomRoutePageModel) then) =
      _$DuelRoomRoutePageModelCopyWithImpl<$Res, DuelRoomRoutePageModel>;
  @useResult
  $Res call(
      {User? user,
      String nickName,
      String? userPicture,
      GameRoomModel roomModel});

  $GameRoomModelCopyWith<$Res> get roomModel;
}

/// @nodoc
class _$DuelRoomRoutePageModelCopyWithImpl<$Res,
        $Val extends DuelRoomRoutePageModel>
    implements $DuelRoomRoutePageModelCopyWith<$Res> {
  _$DuelRoomRoutePageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? nickName = null,
    Object? userPicture = freezed,
    Object? roomModel = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      userPicture: freezed == userPicture
          ? _value.userPicture
          : userPicture // ignore: cast_nullable_to_non_nullable
              as String?,
      roomModel: null == roomModel
          ? _value.roomModel
          : roomModel // ignore: cast_nullable_to_non_nullable
              as GameRoomModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameRoomModelCopyWith<$Res> get roomModel {
    return $GameRoomModelCopyWith<$Res>(_value.roomModel, (value) {
      return _then(_value.copyWith(roomModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DuelRoomRoutePageModelImplCopyWith<$Res>
    implements $DuelRoomRoutePageModelCopyWith<$Res> {
  factory _$$DuelRoomRoutePageModelImplCopyWith(
          _$DuelRoomRoutePageModelImpl value,
          $Res Function(_$DuelRoomRoutePageModelImpl) then) =
      __$$DuelRoomRoutePageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? user,
      String nickName,
      String? userPicture,
      GameRoomModel roomModel});

  @override
  $GameRoomModelCopyWith<$Res> get roomModel;
}

/// @nodoc
class __$$DuelRoomRoutePageModelImplCopyWithImpl<$Res>
    extends _$DuelRoomRoutePageModelCopyWithImpl<$Res,
        _$DuelRoomRoutePageModelImpl>
    implements _$$DuelRoomRoutePageModelImplCopyWith<$Res> {
  __$$DuelRoomRoutePageModelImplCopyWithImpl(
      _$DuelRoomRoutePageModelImpl _value,
      $Res Function(_$DuelRoomRoutePageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? nickName = null,
    Object? userPicture = freezed,
    Object? roomModel = null,
  }) {
    return _then(_$DuelRoomRoutePageModelImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      userPicture: freezed == userPicture
          ? _value.userPicture
          : userPicture // ignore: cast_nullable_to_non_nullable
              as String?,
      roomModel: null == roomModel
          ? _value.roomModel
          : roomModel // ignore: cast_nullable_to_non_nullable
              as GameRoomModel,
    ));
  }
}

/// @nodoc

class _$DuelRoomRoutePageModelImpl implements _DuelRoomRoutePageModel {
  _$DuelRoomRoutePageModelImpl(
      {required this.user,
      required this.nickName,
      required this.userPicture,
      required this.roomModel});

  @override
  final User? user;
  @override
  final String nickName;
  @override
  final String? userPicture;
  @override
  final GameRoomModel roomModel;

  @override
  String toString() {
    return 'DuelRoomRoutePageModel(user: $user, nickName: $nickName, userPicture: $userPicture, roomModel: $roomModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DuelRoomRoutePageModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.userPicture, userPicture) ||
                other.userPicture == userPicture) &&
            (identical(other.roomModel, roomModel) ||
                other.roomModel == roomModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, nickName, userPicture, roomModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DuelRoomRoutePageModelImplCopyWith<_$DuelRoomRoutePageModelImpl>
      get copyWith => __$$DuelRoomRoutePageModelImplCopyWithImpl<
          _$DuelRoomRoutePageModelImpl>(this, _$identity);
}

abstract class _DuelRoomRoutePageModel implements DuelRoomRoutePageModel {
  factory _DuelRoomRoutePageModel(
      {required final User? user,
      required final String nickName,
      required final String? userPicture,
      required final GameRoomModel roomModel}) = _$DuelRoomRoutePageModelImpl;

  @override
  User? get user;
  @override
  String get nickName;
  @override
  String? get userPicture;
  @override
  GameRoomModel get roomModel;
  @override
  @JsonKey(ignore: true)
  _$$DuelRoomRoutePageModelImplCopyWith<_$DuelRoomRoutePageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
