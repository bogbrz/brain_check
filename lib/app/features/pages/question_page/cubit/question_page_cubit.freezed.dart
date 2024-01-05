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
  QuestionModel? get questions => throw _privateConstructorUsedError;

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
  $Res call({String? errorMessage, QuestionModel? questions});

  $QuestionModelCopyWith<$Res>? get questions;
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
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as QuestionModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionModelCopyWith<$Res>? get questions {
    if (_value.questions == null) {
      return null;
    }

    return $QuestionModelCopyWith<$Res>(_value.questions!, (value) {
      return _then(_value.copyWith(questions: value) as $Val);
    });
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
  $Res call({String? errorMessage, QuestionModel? questions});

  @override
  $QuestionModelCopyWith<$Res>? get questions;
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
    Object? questions = freezed,
  }) {
    return _then(_$QuestionPageStateImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as QuestionModel?,
    ));
  }
}

/// @nodoc

class _$QuestionPageStateImpl implements _QuestionPageState {
  _$QuestionPageStateImpl(
      {required this.errorMessage, required this.questions});

  @override
  final String? errorMessage;
  @override
  final QuestionModel? questions;

  @override
  String toString() {
    return 'QuestionPageState(errorMessage: $errorMessage, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionPageStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.questions, questions) ||
                other.questions == questions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, questions);

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
      required final QuestionModel? questions}) = _$QuestionPageStateImpl;

  @override
  String? get errorMessage;
  @override
  QuestionModel? get questions;
  @override
  @JsonKey(ignore: true)
  _$$QuestionPageStateImplCopyWith<_$QuestionPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
