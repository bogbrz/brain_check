// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'difficulty_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DifficultyModel {
  String get name => throw _privateConstructorUsedError;
  Image get icon => throw _privateConstructorUsedError;
  String get nameId => throw _privateConstructorUsedError;
  MaterialColor get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DifficultyModelCopyWith<DifficultyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DifficultyModelCopyWith<$Res> {
  factory $DifficultyModelCopyWith(
          DifficultyModel value, $Res Function(DifficultyModel) then) =
      _$DifficultyModelCopyWithImpl<$Res, DifficultyModel>;
  @useResult
  $Res call({String name, Image icon, String nameId, MaterialColor color});
}

/// @nodoc
class _$DifficultyModelCopyWithImpl<$Res, $Val extends DifficultyModel>
    implements $DifficultyModelCopyWith<$Res> {
  _$DifficultyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? nameId = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Image,
      nameId: null == nameId
          ? _value.nameId
          : nameId // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as MaterialColor,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DifficultyModelImplCopyWith<$Res>
    implements $DifficultyModelCopyWith<$Res> {
  factory _$$DifficultyModelImplCopyWith(_$DifficultyModelImpl value,
          $Res Function(_$DifficultyModelImpl) then) =
      __$$DifficultyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Image icon, String nameId, MaterialColor color});
}

/// @nodoc
class __$$DifficultyModelImplCopyWithImpl<$Res>
    extends _$DifficultyModelCopyWithImpl<$Res, _$DifficultyModelImpl>
    implements _$$DifficultyModelImplCopyWith<$Res> {
  __$$DifficultyModelImplCopyWithImpl(
      _$DifficultyModelImpl _value, $Res Function(_$DifficultyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? nameId = null,
    Object? color = null,
  }) {
    return _then(_$DifficultyModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Image,
      nameId: null == nameId
          ? _value.nameId
          : nameId // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as MaterialColor,
    ));
  }
}

/// @nodoc

class _$DifficultyModelImpl implements _DifficultyModel {
  _$DifficultyModelImpl(
      {required this.name,
      required this.icon,
      required this.nameId,
      required this.color});

  @override
  final String name;
  @override
  final Image icon;
  @override
  final String nameId;
  @override
  final MaterialColor color;

  @override
  String toString() {
    return 'DifficultyModel(name: $name, icon: $icon, nameId: $nameId, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DifficultyModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.nameId, nameId) || other.nameId == nameId) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, icon, nameId, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DifficultyModelImplCopyWith<_$DifficultyModelImpl> get copyWith =>
      __$$DifficultyModelImplCopyWithImpl<_$DifficultyModelImpl>(
          this, _$identity);
}

abstract class _DifficultyModel implements DifficultyModel {
  factory _DifficultyModel(
      {required final String name,
      required final Image icon,
      required final String nameId,
      required final MaterialColor color}) = _$DifficultyModelImpl;

  @override
  String get name;
  @override
  Image get icon;
  @override
  String get nameId;
  @override
  MaterialColor get color;
  @override
  @JsonKey(ignore: true)
  _$$DifficultyModelImplCopyWith<_$DifficultyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
