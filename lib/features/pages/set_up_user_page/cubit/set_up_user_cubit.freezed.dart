// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_up_user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SetUpUserState {
  String? get errorMessage => throw _privateConstructorUsedError;
  List<ProfileModel> get profile => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SetUpUserStateCopyWith<SetUpUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetUpUserStateCopyWith<$Res> {
  factory $SetUpUserStateCopyWith(
          SetUpUserState value, $Res Function(SetUpUserState) then) =
      _$SetUpUserStateCopyWithImpl<$Res, SetUpUserState>;
  @useResult
  $Res call({String? errorMessage, List<ProfileModel> profile, Status status});
}

/// @nodoc
class _$SetUpUserStateCopyWithImpl<$Res, $Val extends SetUpUserState>
    implements $SetUpUserStateCopyWith<$Res> {
  _$SetUpUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? profile = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as List<ProfileModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetUpUserStateImplCopyWith<$Res>
    implements $SetUpUserStateCopyWith<$Res> {
  factory _$$SetUpUserStateImplCopyWith(_$SetUpUserStateImpl value,
          $Res Function(_$SetUpUserStateImpl) then) =
      __$$SetUpUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage, List<ProfileModel> profile, Status status});
}

/// @nodoc
class __$$SetUpUserStateImplCopyWithImpl<$Res>
    extends _$SetUpUserStateCopyWithImpl<$Res, _$SetUpUserStateImpl>
    implements _$$SetUpUserStateImplCopyWith<$Res> {
  __$$SetUpUserStateImplCopyWithImpl(
      _$SetUpUserStateImpl _value, $Res Function(_$SetUpUserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? profile = null,
    Object? status = null,
  }) {
    return _then(_$SetUpUserStateImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: null == profile
          ? _value._profile
          : profile // ignore: cast_nullable_to_non_nullable
              as List<ProfileModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$SetUpUserStateImpl implements _SetUpUserState {
  const _$SetUpUserStateImpl(
      {required this.errorMessage,
      required final List<ProfileModel> profile,
      required this.status})
      : _profile = profile;

  @override
  final String? errorMessage;
  final List<ProfileModel> _profile;
  @override
  List<ProfileModel> get profile {
    if (_profile is EqualUnmodifiableListView) return _profile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profile);
  }

  @override
  final Status status;

  @override
  String toString() {
    return 'SetUpUserState(errorMessage: $errorMessage, profile: $profile, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetUpUserStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._profile, _profile) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage,
      const DeepCollectionEquality().hash(_profile), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetUpUserStateImplCopyWith<_$SetUpUserStateImpl> get copyWith =>
      __$$SetUpUserStateImplCopyWithImpl<_$SetUpUserStateImpl>(
          this, _$identity);
}

abstract class _SetUpUserState implements SetUpUserState {
  const factory _SetUpUserState(
      {required final String? errorMessage,
      required final List<ProfileModel> profile,
      required final Status status}) = _$SetUpUserStateImpl;

  @override
  String? get errorMessage;
  @override
  List<ProfileModel> get profile;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$SetUpUserStateImplCopyWith<_$SetUpUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
