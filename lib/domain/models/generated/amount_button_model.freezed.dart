// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../amount_button_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AmountModel {
  String get name => throw _privateConstructorUsedError;
  int get nameId => throw _privateConstructorUsedError;
  dynamic get required => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AmountModelCopyWith<AmountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountModelCopyWith<$Res> {
  factory $AmountModelCopyWith(
          AmountModel value, $Res Function(AmountModel) then) =
      _$AmountModelCopyWithImpl<$Res, AmountModel>;
  @useResult
  $Res call({String name, int nameId, dynamic required});
}

/// @nodoc
class _$AmountModelCopyWithImpl<$Res, $Val extends AmountModel>
    implements $AmountModelCopyWith<$Res> {
  _$AmountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameId = null,
    Object? required = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameId: null == nameId
          ? _value.nameId
          : nameId // ignore: cast_nullable_to_non_nullable
              as int,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AmountModelImplCopyWith<$Res>
    implements $AmountModelCopyWith<$Res> {
  factory _$$AmountModelImplCopyWith(
          _$AmountModelImpl value, $Res Function(_$AmountModelImpl) then) =
      __$$AmountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int nameId, dynamic required});
}

/// @nodoc
class __$$AmountModelImplCopyWithImpl<$Res>
    extends _$AmountModelCopyWithImpl<$Res, _$AmountModelImpl>
    implements _$$AmountModelImplCopyWith<$Res> {
  __$$AmountModelImplCopyWithImpl(
      _$AmountModelImpl _value, $Res Function(_$AmountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameId = null,
    Object? required = freezed,
  }) {
    return _then(_$AmountModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameId: null == nameId
          ? _value.nameId
          : nameId // ignore: cast_nullable_to_non_nullable
              as int,
      required: freezed == required ? _value.required! : required,
    ));
  }
}

/// @nodoc

class _$AmountModelImpl implements _AmountModel {
  _$AmountModelImpl({required this.name, required this.nameId, this.required});

  @override
  final String name;
  @override
  final int nameId;
  @override
  final dynamic required;

  @override
  String toString() {
    return 'AmountModel(name: $name, nameId: $nameId, required: $required)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmountModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameId, nameId) || other.nameId == nameId) &&
            const DeepCollectionEquality().equals(other.required, required));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, nameId, const DeepCollectionEquality().hash(required));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmountModelImplCopyWith<_$AmountModelImpl> get copyWith =>
      __$$AmountModelImplCopyWithImpl<_$AmountModelImpl>(this, _$identity);
}

abstract class _AmountModel implements AmountModel {
  factory _AmountModel(
      {required final String name,
      required final int nameId,
      final dynamic required}) = _$AmountModelImpl;

  @override
  String get name;
  @override
  int get nameId;
  @override
  dynamic get required;
  @override
  @JsonKey(ignore: true)
  _$$AmountModelImplCopyWith<_$AmountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
