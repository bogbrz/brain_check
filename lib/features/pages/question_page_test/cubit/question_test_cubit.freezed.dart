// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_test_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionTestPageState {
  String? get errorMessage => throw _privateConstructorUsedError;
  List<QuestionModel> get questions => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionTestPageStateCopyWith<QuestionTestPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionTestPageStateCopyWith<$Res> {
  factory $QuestionTestPageStateCopyWith(QuestionTestPageState value,
          $Res Function(QuestionTestPageState) then) =
      _$QuestionTestPageStateCopyWithImpl<$Res, QuestionTestPageState>;
  @useResult
  $Res call(
      {String? errorMessage, List<QuestionModel> questions, Status status});
}

/// @nodoc
class _$QuestionTestPageStateCopyWithImpl<$Res,
        $Val extends QuestionTestPageState>
    implements $QuestionTestPageStateCopyWith<$Res> {
  _$QuestionTestPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? questions = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionTestPageStateImplCopyWith<$Res>
    implements $QuestionTestPageStateCopyWith<$Res> {
  factory _$$QuestionTestPageStateImplCopyWith(
          _$QuestionTestPageStateImpl value,
          $Res Function(_$QuestionTestPageStateImpl) then) =
      __$$QuestionTestPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage, List<QuestionModel> questions, Status status});
}

/// @nodoc
class __$$QuestionTestPageStateImplCopyWithImpl<$Res>
    extends _$QuestionTestPageStateCopyWithImpl<$Res,
        _$QuestionTestPageStateImpl>
    implements _$$QuestionTestPageStateImplCopyWith<$Res> {
  __$$QuestionTestPageStateImplCopyWithImpl(_$QuestionTestPageStateImpl _value,
      $Res Function(_$QuestionTestPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? questions = null,
    Object? status = null,
  }) {
    return _then(_$QuestionTestPageStateImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$QuestionTestPageStateImpl implements _QuestionTestPageState {
  _$QuestionTestPageStateImpl(
      {required this.errorMessage,
      required final List<QuestionModel> questions,
      required this.status})
      : _questions = questions;

  @override
  final String? errorMessage;
  final List<QuestionModel> _questions;
  @override
  List<QuestionModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final Status status;

  @override
  String toString() {
    return 'QuestionTestPageState(errorMessage: $errorMessage, questions: $questions, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionTestPageStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage,
      const DeepCollectionEquality().hash(_questions), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionTestPageStateImplCopyWith<_$QuestionTestPageStateImpl>
      get copyWith => __$$QuestionTestPageStateImplCopyWithImpl<
          _$QuestionTestPageStateImpl>(this, _$identity);
}

abstract class _QuestionTestPageState implements QuestionTestPageState {
  factory _QuestionTestPageState(
      {required final String? errorMessage,
      required final List<QuestionModel> questions,
      required final Status status}) = _$QuestionTestPageStateImpl;

  @override
  String? get errorMessage;
  @override
  List<QuestionModel> get questions;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$QuestionTestPageStateImplCopyWith<_$QuestionTestPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
