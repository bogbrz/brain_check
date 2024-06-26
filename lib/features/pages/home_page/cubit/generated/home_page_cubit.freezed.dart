// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../home_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageState {
  String? get errorMessage => throw _privateConstructorUsedError;
  List<ProfileModel> get profile => throw _privateConstructorUsedError;
  Overall get overAllInfo => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get uploadedImageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {String? errorMessage,
      List<ProfileModel> profile,
      Overall overAllInfo,
      Status status,
      String? uploadedImageUrl});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? profile = null,
    Object? overAllInfo = null,
    Object? status = null,
    Object? uploadedImageUrl = freezed,
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
      overAllInfo: null == overAllInfo
          ? _value.overAllInfo
          : overAllInfo // ignore: cast_nullable_to_non_nullable
              as Overall,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      uploadedImageUrl: freezed == uploadedImageUrl
          ? _value.uploadedImageUrl
          : uploadedImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      List<ProfileModel> profile,
      Overall overAllInfo,
      Status status,
      String? uploadedImageUrl});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? profile = null,
    Object? overAllInfo = null,
    Object? status = null,
    Object? uploadedImageUrl = freezed,
  }) {
    return _then(_$InitialImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: null == profile
          ? _value._profile
          : profile // ignore: cast_nullable_to_non_nullable
              as List<ProfileModel>,
      overAllInfo: null == overAllInfo
          ? _value.overAllInfo
          : overAllInfo // ignore: cast_nullable_to_non_nullable
              as Overall,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      uploadedImageUrl: freezed == uploadedImageUrl
          ? _value.uploadedImageUrl
          : uploadedImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.errorMessage,
      required final List<ProfileModel> profile,
      required this.overAllInfo,
      required this.status,
      required this.uploadedImageUrl})
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
  final Overall overAllInfo;
  @override
  final Status status;
  @override
  final String? uploadedImageUrl;

  @override
  String toString() {
    return 'HomePageState(errorMessage: $errorMessage, profile: $profile, overAllInfo: $overAllInfo, status: $status, uploadedImageUrl: $uploadedImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._profile, _profile) &&
            (identical(other.overAllInfo, overAllInfo) ||
                other.overAllInfo == overAllInfo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.uploadedImageUrl, uploadedImageUrl) ||
                other.uploadedImageUrl == uploadedImageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorMessage,
      const DeepCollectionEquality().hash(_profile),
      overAllInfo,
      status,
      uploadedImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements HomePageState {
  const factory _Initial(
      {required final String? errorMessage,
      required final List<ProfileModel> profile,
      required final Overall overAllInfo,
      required final Status status,
      required final String? uploadedImageUrl}) = _$InitialImpl;

  @override
  String? get errorMessage;
  @override
  List<ProfileModel> get profile;
  @override
  Overall get overAllInfo;
  @override
  Status get status;
  @override
  String? get uploadedImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
