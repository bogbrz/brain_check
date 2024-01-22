// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RootPageState {
  User? get user => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RootPageStateCopyWith<RootPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootPageStateCopyWith<$Res> {
  factory $RootPageStateCopyWith(
          RootPageState value, $Res Function(RootPageState) then) =
      _$RootPageStateCopyWithImpl<$Res, RootPageState>;
  @useResult
  $Res call({User? user, String errorMessage});
}

/// @nodoc
class _$RootPageStateCopyWithImpl<$Res, $Val extends RootPageState>
    implements $RootPageStateCopyWith<$Res> {
  _$RootPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RootPageStateImplCopyWith<$Res>
    implements $RootPageStateCopyWith<$Res> {
  factory _$$RootPageStateImplCopyWith(
          _$RootPageStateImpl value, $Res Function(_$RootPageStateImpl) then) =
      __$$RootPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, String errorMessage});
}

/// @nodoc
class __$$RootPageStateImplCopyWithImpl<$Res>
    extends _$RootPageStateCopyWithImpl<$Res, _$RootPageStateImpl>
    implements _$$RootPageStateImplCopyWith<$Res> {
  __$$RootPageStateImplCopyWithImpl(
      _$RootPageStateImpl _value, $Res Function(_$RootPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? errorMessage = null,
  }) {
    return _then(_$RootPageStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RootPageStateImpl implements _RootPageState {
  _$RootPageStateImpl({required this.user, required this.errorMessage});

  @override
  final User? user;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'RootPageState(user: $user, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootPageStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RootPageStateImplCopyWith<_$RootPageStateImpl> get copyWith =>
      __$$RootPageStateImplCopyWithImpl<_$RootPageStateImpl>(this, _$identity);
}

abstract class _RootPageState implements RootPageState {
  factory _RootPageState(
      {required final User? user,
      required final String errorMessage}) = _$RootPageStateImpl;

  @override
  User? get user;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$RootPageStateImplCopyWith<_$RootPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
