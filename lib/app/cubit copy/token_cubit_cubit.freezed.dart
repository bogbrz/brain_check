// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_cubit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TokenCubitState {
  TokenModel get tokenModel => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenCubitStateCopyWith<TokenCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCubitStateCopyWith<$Res> {
  factory $TokenCubitStateCopyWith(
          TokenCubitState value, $Res Function(TokenCubitState) then) =
      _$TokenCubitStateCopyWithImpl<$Res, TokenCubitState>;
  @useResult
  $Res call({TokenModel tokenModel, String? errorMessage});

  $TokenModelCopyWith<$Res> get tokenModel;
}

/// @nodoc
class _$TokenCubitStateCopyWithImpl<$Res, $Val extends TokenCubitState>
    implements $TokenCubitStateCopyWith<$Res> {
  _$TokenCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenModel = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      tokenModel: null == tokenModel
          ? _value.tokenModel
          : tokenModel // ignore: cast_nullable_to_non_nullable
              as TokenModel,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenModelCopyWith<$Res> get tokenModel {
    return $TokenModelCopyWith<$Res>(_value.tokenModel, (value) {
      return _then(_value.copyWith(tokenModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TokenCubitStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TokenModel tokenModel, String? errorMessage});

  @override
  $TokenModelCopyWith<$Res> get tokenModel;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TokenCubitStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenModel = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$InitialImpl(
      tokenModel: null == tokenModel
          ? _value.tokenModel
          : tokenModel // ignore: cast_nullable_to_non_nullable
              as TokenModel,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({required this.tokenModel, required this.errorMessage});

  @override
  final TokenModel tokenModel;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'TokenCubitState(tokenModel: $tokenModel, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.tokenModel, tokenModel) ||
                other.tokenModel == tokenModel) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tokenModel, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements TokenCubitState {
  const factory _Initial(
      {required final TokenModel tokenModel,
      required final String? errorMessage}) = _$InitialImpl;

  @override
  TokenModel get tokenModel;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
