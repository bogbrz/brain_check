// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../categories_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WelcomeCategory _$WelcomeCategoryFromJson(Map<String, dynamic> json) {
  return _WelcomeCategory.fromJson(json);
}

/// @nodoc
mixin _$WelcomeCategory {
  int? get categoryId => throw _privateConstructorUsedError;
  CategoryQuestionCount? get categoryQuestionCount =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WelcomeCategoryCopyWith<WelcomeCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WelcomeCategoryCopyWith<$Res> {
  factory $WelcomeCategoryCopyWith(
          WelcomeCategory value, $Res Function(WelcomeCategory) then) =
      _$WelcomeCategoryCopyWithImpl<$Res, WelcomeCategory>;
  @useResult
  $Res call({int? categoryId, CategoryQuestionCount? categoryQuestionCount});

  $CategoryQuestionCountCopyWith<$Res>? get categoryQuestionCount;
}

/// @nodoc
class _$WelcomeCategoryCopyWithImpl<$Res, $Val extends WelcomeCategory>
    implements $WelcomeCategoryCopyWith<$Res> {
  _$WelcomeCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryQuestionCount = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryQuestionCount: freezed == categoryQuestionCount
          ? _value.categoryQuestionCount
          : categoryQuestionCount // ignore: cast_nullable_to_non_nullable
              as CategoryQuestionCount?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryQuestionCountCopyWith<$Res>? get categoryQuestionCount {
    if (_value.categoryQuestionCount == null) {
      return null;
    }

    return $CategoryQuestionCountCopyWith<$Res>(_value.categoryQuestionCount!,
        (value) {
      return _then(_value.copyWith(categoryQuestionCount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WelcomeCategoryImplCopyWith<$Res>
    implements $WelcomeCategoryCopyWith<$Res> {
  factory _$$WelcomeCategoryImplCopyWith(_$WelcomeCategoryImpl value,
          $Res Function(_$WelcomeCategoryImpl) then) =
      __$$WelcomeCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? categoryId, CategoryQuestionCount? categoryQuestionCount});

  @override
  $CategoryQuestionCountCopyWith<$Res>? get categoryQuestionCount;
}

/// @nodoc
class __$$WelcomeCategoryImplCopyWithImpl<$Res>
    extends _$WelcomeCategoryCopyWithImpl<$Res, _$WelcomeCategoryImpl>
    implements _$$WelcomeCategoryImplCopyWith<$Res> {
  __$$WelcomeCategoryImplCopyWithImpl(
      _$WelcomeCategoryImpl _value, $Res Function(_$WelcomeCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryQuestionCount = freezed,
  }) {
    return _then(_$WelcomeCategoryImpl(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryQuestionCount: freezed == categoryQuestionCount
          ? _value.categoryQuestionCount
          : categoryQuestionCount // ignore: cast_nullable_to_non_nullable
              as CategoryQuestionCount?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WelcomeCategoryImpl implements _WelcomeCategory {
  _$WelcomeCategoryImpl(
      {required this.categoryId, required this.categoryQuestionCount});

  factory _$WelcomeCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WelcomeCategoryImplFromJson(json);

  @override
  final int? categoryId;
  @override
  final CategoryQuestionCount? categoryQuestionCount;

  @override
  String toString() {
    return 'WelcomeCategory(categoryId: $categoryId, categoryQuestionCount: $categoryQuestionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WelcomeCategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryQuestionCount, categoryQuestionCount) ||
                other.categoryQuestionCount == categoryQuestionCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryId, categoryQuestionCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WelcomeCategoryImplCopyWith<_$WelcomeCategoryImpl> get copyWith =>
      __$$WelcomeCategoryImplCopyWithImpl<_$WelcomeCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WelcomeCategoryImplToJson(
      this,
    );
  }
}

abstract class _WelcomeCategory implements WelcomeCategory {
  factory _WelcomeCategory(
          {required final int? categoryId,
          required final CategoryQuestionCount? categoryQuestionCount}) =
      _$WelcomeCategoryImpl;

  factory _WelcomeCategory.fromJson(Map<String, dynamic> json) =
      _$WelcomeCategoryImpl.fromJson;

  @override
  int? get categoryId;
  @override
  CategoryQuestionCount? get categoryQuestionCount;
  @override
  @JsonKey(ignore: true)
  _$$WelcomeCategoryImplCopyWith<_$WelcomeCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryQuestionCount _$CategoryQuestionCountFromJson(
    Map<String, dynamic> json) {
  return _CategoryQuestionCount.fromJson(json);
}

/// @nodoc
mixin _$CategoryQuestionCount {
  int get totalQuestionCount => throw _privateConstructorUsedError;
  int get totalEasyQuestionCount => throw _privateConstructorUsedError;
  int get totalMediumQuestionCount => throw _privateConstructorUsedError;
  int get totalHardQuestionCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryQuestionCountCopyWith<CategoryQuestionCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryQuestionCountCopyWith<$Res> {
  factory $CategoryQuestionCountCopyWith(CategoryQuestionCount value,
          $Res Function(CategoryQuestionCount) then) =
      _$CategoryQuestionCountCopyWithImpl<$Res, CategoryQuestionCount>;
  @useResult
  $Res call(
      {int totalQuestionCount,
      int totalEasyQuestionCount,
      int totalMediumQuestionCount,
      int totalHardQuestionCount});
}

/// @nodoc
class _$CategoryQuestionCountCopyWithImpl<$Res,
        $Val extends CategoryQuestionCount>
    implements $CategoryQuestionCountCopyWith<$Res> {
  _$CategoryQuestionCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuestionCount = null,
    Object? totalEasyQuestionCount = null,
    Object? totalMediumQuestionCount = null,
    Object? totalHardQuestionCount = null,
  }) {
    return _then(_value.copyWith(
      totalQuestionCount: null == totalQuestionCount
          ? _value.totalQuestionCount
          : totalQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalEasyQuestionCount: null == totalEasyQuestionCount
          ? _value.totalEasyQuestionCount
          : totalEasyQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalMediumQuestionCount: null == totalMediumQuestionCount
          ? _value.totalMediumQuestionCount
          : totalMediumQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalHardQuestionCount: null == totalHardQuestionCount
          ? _value.totalHardQuestionCount
          : totalHardQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryQuestionCountImplCopyWith<$Res>
    implements $CategoryQuestionCountCopyWith<$Res> {
  factory _$$CategoryQuestionCountImplCopyWith(
          _$CategoryQuestionCountImpl value,
          $Res Function(_$CategoryQuestionCountImpl) then) =
      __$$CategoryQuestionCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalQuestionCount,
      int totalEasyQuestionCount,
      int totalMediumQuestionCount,
      int totalHardQuestionCount});
}

/// @nodoc
class __$$CategoryQuestionCountImplCopyWithImpl<$Res>
    extends _$CategoryQuestionCountCopyWithImpl<$Res,
        _$CategoryQuestionCountImpl>
    implements _$$CategoryQuestionCountImplCopyWith<$Res> {
  __$$CategoryQuestionCountImplCopyWithImpl(_$CategoryQuestionCountImpl _value,
      $Res Function(_$CategoryQuestionCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuestionCount = null,
    Object? totalEasyQuestionCount = null,
    Object? totalMediumQuestionCount = null,
    Object? totalHardQuestionCount = null,
  }) {
    return _then(_$CategoryQuestionCountImpl(
      totalQuestionCount: null == totalQuestionCount
          ? _value.totalQuestionCount
          : totalQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalEasyQuestionCount: null == totalEasyQuestionCount
          ? _value.totalEasyQuestionCount
          : totalEasyQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalMediumQuestionCount: null == totalMediumQuestionCount
          ? _value.totalMediumQuestionCount
          : totalMediumQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalHardQuestionCount: null == totalHardQuestionCount
          ? _value.totalHardQuestionCount
          : totalHardQuestionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CategoryQuestionCountImpl implements _CategoryQuestionCount {
  _$CategoryQuestionCountImpl(
      {required this.totalQuestionCount,
      required this.totalEasyQuestionCount,
      required this.totalMediumQuestionCount,
      required this.totalHardQuestionCount});

  factory _$CategoryQuestionCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryQuestionCountImplFromJson(json);

  @override
  final int totalQuestionCount;
  @override
  final int totalEasyQuestionCount;
  @override
  final int totalMediumQuestionCount;
  @override
  final int totalHardQuestionCount;

  @override
  String toString() {
    return 'CategoryQuestionCount(totalQuestionCount: $totalQuestionCount, totalEasyQuestionCount: $totalEasyQuestionCount, totalMediumQuestionCount: $totalMediumQuestionCount, totalHardQuestionCount: $totalHardQuestionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryQuestionCountImpl &&
            (identical(other.totalQuestionCount, totalQuestionCount) ||
                other.totalQuestionCount == totalQuestionCount) &&
            (identical(other.totalEasyQuestionCount, totalEasyQuestionCount) ||
                other.totalEasyQuestionCount == totalEasyQuestionCount) &&
            (identical(
                    other.totalMediumQuestionCount, totalMediumQuestionCount) ||
                other.totalMediumQuestionCount == totalMediumQuestionCount) &&
            (identical(other.totalHardQuestionCount, totalHardQuestionCount) ||
                other.totalHardQuestionCount == totalHardQuestionCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalQuestionCount,
      totalEasyQuestionCount, totalMediumQuestionCount, totalHardQuestionCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryQuestionCountImplCopyWith<_$CategoryQuestionCountImpl>
      get copyWith => __$$CategoryQuestionCountImplCopyWithImpl<
          _$CategoryQuestionCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryQuestionCountImplToJson(
      this,
    );
  }
}

abstract class _CategoryQuestionCount implements CategoryQuestionCount {
  factory _CategoryQuestionCount(
      {required final int totalQuestionCount,
      required final int totalEasyQuestionCount,
      required final int totalMediumQuestionCount,
      required final int totalHardQuestionCount}) = _$CategoryQuestionCountImpl;

  factory _CategoryQuestionCount.fromJson(Map<String, dynamic> json) =
      _$CategoryQuestionCountImpl.fromJson;

  @override
  int get totalQuestionCount;
  @override
  int get totalEasyQuestionCount;
  @override
  int get totalMediumQuestionCount;
  @override
  int get totalHardQuestionCount;
  @override
  @JsonKey(ignore: true)
  _$$CategoryQuestionCountImplCopyWith<_$CategoryQuestionCountImpl>
      get copyWith => throw _privateConstructorUsedError;
}
