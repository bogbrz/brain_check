// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionPageState {
  String? get errorMessage => throw _privateConstructorUsedError;
  List<QuestionModel> get questions => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionPageStateCopyWith<QuestionPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionPageStateCopyWith<$Res> {
  factory $QuestionPageStateCopyWith(
          QuestionPageState value, $Res Function(QuestionPageState) then) =
      _$QuestionPageStateCopyWithImpl<$Res, QuestionPageState>;
  @useResult
  $Res call(
      {String? errorMessage,
      List<QuestionModel> questions,
      List<String> answers});
}

/// @nodoc
class _$QuestionPageStateCopyWithImpl<$Res, $Val extends QuestionPageState>
    implements $QuestionPageStateCopyWith<$Res> {
  _$QuestionPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? questions = null,
    Object? answers = null,
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
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionPageStateImplCopyWith<$Res>
    implements $QuestionPageStateCopyWith<$Res> {
  factory _$$QuestionPageStateImplCopyWith(_$QuestionPageStateImpl value,
          $Res Function(_$QuestionPageStateImpl) then) =
      __$$QuestionPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      List<QuestionModel> questions,
      List<String> answers});
}

/// @nodoc
class __$$QuestionPageStateImplCopyWithImpl<$Res>
    extends _$QuestionPageStateCopyWithImpl<$Res, _$QuestionPageStateImpl>
    implements _$$QuestionPageStateImplCopyWith<$Res> {
  __$$QuestionPageStateImplCopyWithImpl(_$QuestionPageStateImpl _value,
      $Res Function(_$QuestionPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? questions = null,
    Object? answers = null,
  }) {
    return _then(_$QuestionPageStateImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$QuestionPageStateImpl implements _QuestionPageState {
  _$QuestionPageStateImpl(
      {required this.errorMessage,
      required final List<QuestionModel> questions,
      required final List<String> answers})
      : _questions = questions,
        _answers = answers;

  @override
  final String? errorMessage;
  final List<QuestionModel> _questions;
  @override
  List<QuestionModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final List<String> _answers;
  @override
  List<String> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'QuestionPageState(errorMessage: $errorMessage, questions: $questions, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionPageStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorMessage,
      const DeepCollectionEquality().hash(_questions),
      const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionPageStateImplCopyWith<_$QuestionPageStateImpl> get copyWith =>
      __$$QuestionPageStateImplCopyWithImpl<_$QuestionPageStateImpl>(
          this, _$identity);
}

abstract class _QuestionPageState implements QuestionPageState {
  factory _QuestionPageState(
      {required final String? errorMessage,
      required final List<QuestionModel> questions,
      required final List<String> answers}) = _$QuestionPageStateImpl;

  @override
  String? get errorMessage;
  @override
  List<QuestionModel> get questions;
  @override
  List<String> get answers;
  @override
  @JsonKey(ignore: true)
  _$$QuestionPageStateImplCopyWith<_$QuestionPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
