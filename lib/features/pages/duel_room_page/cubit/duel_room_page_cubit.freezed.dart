// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duel_room_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DuelRoomPageState {
  String? get errorMessage => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  List<PlayerModel> get playerOne => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DuelRoomPageStateCopyWith<DuelRoomPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DuelRoomPageStateCopyWith<$Res> {
  factory $DuelRoomPageStateCopyWith(
          DuelRoomPageState value, $Res Function(DuelRoomPageState) then) =
      _$DuelRoomPageStateCopyWithImpl<$Res, DuelRoomPageState>;
  @useResult
  $Res call({String? errorMessage, Status status, List<PlayerModel> playerOne});
}

/// @nodoc
class _$DuelRoomPageStateCopyWithImpl<$Res, $Val extends DuelRoomPageState>
    implements $DuelRoomPageStateCopyWith<$Res> {
  _$DuelRoomPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? status = null,
    Object? playerOne = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      playerOne: null == playerOne
          ? _value.playerOne
          : playerOne // ignore: cast_nullable_to_non_nullable
              as List<PlayerModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $DuelRoomPageStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage, Status status, List<PlayerModel> playerOne});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DuelRoomPageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? status = null,
    Object? playerOne = null,
  }) {
    return _then(_$InitialImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      playerOne: null == playerOne
          ? _value._playerOne
          : playerOne // ignore: cast_nullable_to_non_nullable
              as List<PlayerModel>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.errorMessage,
      required this.status,
      required final List<PlayerModel> playerOne})
      : _playerOne = playerOne;

  @override
  final String? errorMessage;
  @override
  final Status status;
  final List<PlayerModel> _playerOne;
  @override
  List<PlayerModel> get playerOne {
    if (_playerOne is EqualUnmodifiableListView) return _playerOne;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerOne);
  }

  @override
  String toString() {
    return 'DuelRoomPageState(errorMessage: $errorMessage, status: $status, playerOne: $playerOne)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._playerOne, _playerOne));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, status,
      const DeepCollectionEquality().hash(_playerOne));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements DuelRoomPageState {
  const factory _Initial(
      {required final String? errorMessage,
      required final Status status,
      required final List<PlayerModel> playerOne}) = _$InitialImpl;

  @override
  String? get errorMessage;
  @override
  Status get status;
  @override
  List<PlayerModel> get playerOne;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}