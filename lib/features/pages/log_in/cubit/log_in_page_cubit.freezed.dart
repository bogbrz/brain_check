// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_in_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogInPageState {
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogInPageStateCopyWith<LogInPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInPageStateCopyWith<$Res> {
  factory $LogInPageStateCopyWith(
          LogInPageState value, $Res Function(LogInPageState) then) =
      _$LogInPageStateCopyWithImpl<$Res, LogInPageState>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$LogInPageStateCopyWithImpl<$Res, $Val extends LogInPageState>
    implements $LogInPageStateCopyWith<$Res> {
  _$LogInPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogInPageStateImplCopyWith<$Res>
    implements $LogInPageStateCopyWith<$Res> {
  factory _$$LogInPageStateImplCopyWith(_$LogInPageStateImpl value,
          $Res Function(_$LogInPageStateImpl) then) =
      __$$LogInPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$LogInPageStateImplCopyWithImpl<$Res>
    extends _$LogInPageStateCopyWithImpl<$Res, _$LogInPageStateImpl>
    implements _$$LogInPageStateImplCopyWith<$Res> {
  __$$LogInPageStateImplCopyWithImpl(
      _$LogInPageStateImpl _value, $Res Function(_$LogInPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$LogInPageStateImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogInPageStateImpl implements _LogInPageState {
  _$LogInPageStateImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'LogInPageState(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInPageStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogInPageStateImplCopyWith<_$LogInPageStateImpl> get copyWith =>
      __$$LogInPageStateImplCopyWithImpl<_$LogInPageStateImpl>(
          this, _$identity);
}

abstract class _LogInPageState implements LogInPageState {
  factory _LogInPageState({required final String errorMessage}) =
      _$LogInPageStateImpl;

  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$LogInPageStateImplCopyWith<_$LogInPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
