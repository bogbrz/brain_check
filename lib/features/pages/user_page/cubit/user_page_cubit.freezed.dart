// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPageState {
  String? get errorMessage => throw _privateConstructorUsedError;
  List<ProfileModel> get profile => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPageStateCopyWith<UserPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPageStateCopyWith<$Res> {
  factory $UserPageStateCopyWith(
          UserPageState value, $Res Function(UserPageState) then) =
      _$UserPageStateCopyWithImpl<$Res, UserPageState>;
  @useResult
  $Res call({String? errorMessage, List<ProfileModel> profile, Status status});
}

/// @nodoc
class _$UserPageStateCopyWithImpl<$Res, $Val extends UserPageState>
    implements $UserPageStateCopyWith<$Res> {
  _$UserPageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$UserPageStateImplCopyWith<$Res>
    implements $UserPageStateCopyWith<$Res> {
  factory _$$UserPageStateImplCopyWith(
          _$UserPageStateImpl value, $Res Function(_$UserPageStateImpl) then) =
      __$$UserPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage, List<ProfileModel> profile, Status status});
}

/// @nodoc
class __$$UserPageStateImplCopyWithImpl<$Res>
    extends _$UserPageStateCopyWithImpl<$Res, _$UserPageStateImpl>
    implements _$$UserPageStateImplCopyWith<$Res> {
  __$$UserPageStateImplCopyWithImpl(
      _$UserPageStateImpl _value, $Res Function(_$UserPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? profile = null,
    Object? status = null,
  }) {
    return _then(_$UserPageStateImpl(
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

class _$UserPageStateImpl implements _UserPageState {
  const _$UserPageStateImpl(
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
    return 'UserPageState(errorMessage: $errorMessage, profile: $profile, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPageStateImpl &&
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
  _$$UserPageStateImplCopyWith<_$UserPageStateImpl> get copyWith =>
      __$$UserPageStateImplCopyWithImpl<_$UserPageStateImpl>(this, _$identity);
}

abstract class _UserPageState implements UserPageState {
  const factory _UserPageState(
      {required final String? errorMessage,
      required final List<ProfileModel> profile,
      required final Status status}) = _$UserPageStateImpl;

  @override
  String? get errorMessage;
  @override
  List<ProfileModel> get profile;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$UserPageStateImplCopyWith<_$UserPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
