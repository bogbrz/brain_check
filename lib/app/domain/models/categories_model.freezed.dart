// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  List<TriviaCategory> get triviaCategories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call({List<TriviaCategory> triviaCategories});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? triviaCategories = null,
  }) {
    return _then(_value.copyWith(
      triviaCategories: null == triviaCategories
          ? _value.triviaCategories
          : triviaCategories // ignore: cast_nullable_to_non_nullable
              as List<TriviaCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TriviaCategory> triviaCategories});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? triviaCategories = null,
  }) {
    return _then(_$CategoryModelImpl(
      triviaCategories: null == triviaCategories
          ? _value._triviaCategories
          : triviaCategories // ignore: cast_nullable_to_non_nullable
              as List<TriviaCategory>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CategoryModelImpl implements _CategoryModel {
  _$CategoryModelImpl({required final List<TriviaCategory> triviaCategories})
      : _triviaCategories = triviaCategories;

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  final List<TriviaCategory> _triviaCategories;
  @override
  List<TriviaCategory> get triviaCategories {
    if (_triviaCategories is EqualUnmodifiableListView)
      return _triviaCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_triviaCategories);
  }

  @override
  String toString() {
    return 'CategoryModel(triviaCategories: $triviaCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            const DeepCollectionEquality()
                .equals(other._triviaCategories, _triviaCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_triviaCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  factory _CategoryModel(
          {required final List<TriviaCategory> triviaCategories}) =
      _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  List<TriviaCategory> get triviaCategories;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TriviaCategory _$TriviaCategoryFromJson(Map<String, dynamic> json) {
  return _TriviaCategory.fromJson(json);
}

/// @nodoc
mixin _$TriviaCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TriviaCategoryCopyWith<TriviaCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriviaCategoryCopyWith<$Res> {
  factory $TriviaCategoryCopyWith(
          TriviaCategory value, $Res Function(TriviaCategory) then) =
      _$TriviaCategoryCopyWithImpl<$Res, TriviaCategory>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$TriviaCategoryCopyWithImpl<$Res, $Val extends TriviaCategory>
    implements $TriviaCategoryCopyWith<$Res> {
  _$TriviaCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TriviaCategoryImplCopyWith<$Res>
    implements $TriviaCategoryCopyWith<$Res> {
  factory _$$TriviaCategoryImplCopyWith(_$TriviaCategoryImpl value,
          $Res Function(_$TriviaCategoryImpl) then) =
      __$$TriviaCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$TriviaCategoryImplCopyWithImpl<$Res>
    extends _$TriviaCategoryCopyWithImpl<$Res, _$TriviaCategoryImpl>
    implements _$$TriviaCategoryImplCopyWith<$Res> {
  __$$TriviaCategoryImplCopyWithImpl(
      _$TriviaCategoryImpl _value, $Res Function(_$TriviaCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$TriviaCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TriviaCategoryImpl implements _TriviaCategory {
  _$TriviaCategoryImpl({required this.id, required this.name});

  factory _$TriviaCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TriviaCategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'TriviaCategory(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TriviaCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TriviaCategoryImplCopyWith<_$TriviaCategoryImpl> get copyWith =>
      __$$TriviaCategoryImplCopyWithImpl<_$TriviaCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TriviaCategoryImplToJson(
      this,
    );
  }
}

abstract class _TriviaCategory implements TriviaCategory {
  factory _TriviaCategory({required final int id, required final String name}) =
      _$TriviaCategoryImpl;

  factory _TriviaCategory.fromJson(Map<String, dynamic> json) =
      _$TriviaCategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$TriviaCategoryImplCopyWith<_$TriviaCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
