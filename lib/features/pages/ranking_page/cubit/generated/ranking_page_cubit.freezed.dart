// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../ranking_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RankingPageState {
  String? get errorMessage => throw _privateConstructorUsedError;
  List<ProfileModel> get profiles => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RankingPageStateCopyWith<RankingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingPageStateCopyWith<$Res> {
  factory $RankingPageStateCopyWith(
          RankingPageState value, $Res Function(RankingPageState) then) =
      _$RankingPageStateCopyWithImpl<$Res, RankingPageState>;
  @useResult
  $Res call({String? errorMessage, List<ProfileModel> profiles, Status status});
}

/// @nodoc
class _$RankingPageStateCopyWithImpl<$Res, $Val extends RankingPageState>
    implements $RankingPageStateCopyWith<$Res> {
  _$RankingPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? profiles = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      profiles: null == profiles
          ? _value.profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<ProfileModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RankingPageStateImplCopyWith<$Res>
    implements $RankingPageStateCopyWith<$Res> {
  factory _$$RankingPageStateImplCopyWith(_$RankingPageStateImpl value,
          $Res Function(_$RankingPageStateImpl) then) =
      __$$RankingPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage, List<ProfileModel> profiles, Status status});
}

/// @nodoc
class __$$RankingPageStateImplCopyWithImpl<$Res>
    extends _$RankingPageStateCopyWithImpl<$Res, _$RankingPageStateImpl>
    implements _$$RankingPageStateImplCopyWith<$Res> {
  __$$RankingPageStateImplCopyWithImpl(_$RankingPageStateImpl _value,
      $Res Function(_$RankingPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? profiles = null,
    Object? status = null,
  }) {
    return _then(_$RankingPageStateImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      profiles: null == profiles
          ? _value._profiles
          : profiles // ignore: cast_nullable_to_non_nullable
              as List<ProfileModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$RankingPageStateImpl implements _RankingPageState {
  const _$RankingPageStateImpl(
      {required this.errorMessage,
      required final List<ProfileModel> profiles,
      required this.status})
      : _profiles = profiles;

  @override
  final String? errorMessage;
  final List<ProfileModel> _profiles;
  @override
  List<ProfileModel> get profiles {
    if (_profiles is EqualUnmodifiableListView) return _profiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profiles);
  }

  @override
  final Status status;

  @override
  String toString() {
    return 'RankingPageState(errorMessage: $errorMessage, profiles: $profiles, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingPageStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._profiles, _profiles) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage,
      const DeepCollectionEquality().hash(_profiles), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingPageStateImplCopyWith<_$RankingPageStateImpl> get copyWith =>
      __$$RankingPageStateImplCopyWithImpl<_$RankingPageStateImpl>(
          this, _$identity);
}

abstract class _RankingPageState implements RankingPageState {
  const factory _RankingPageState(
      {required final String? errorMessage,
      required final List<ProfileModel> profiles,
      required final Status status}) = _$RankingPageStateImpl;

  @override
  String? get errorMessage;
  @override
  List<ProfileModel> get profiles;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$RankingPageStateImplCopyWith<_$RankingPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
