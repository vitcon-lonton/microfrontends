// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'forget_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ForgetPasswordStateTearOff {
  const _$ForgetPasswordStateTearOff();

  _ForgetPasswordState call(
      {required EmailAddress emailAddress,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      ProcessingStatus status = const ProcessingStatus.idle(),
      required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) {
    return _ForgetPasswordState(
      emailAddress: emailAddress,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      status: status,
      failureOrSuccessOption: failureOrSuccessOption,
    );
  }
}

/// @nodoc
const $ForgetPasswordState = _$ForgetPasswordStateTearOff();

/// @nodoc
mixin _$ForgetPasswordState {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordStateCopyWith<ForgetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordStateCopyWith<$Res> {
  factory $ForgetPasswordStateCopyWith(
          ForgetPasswordState value, $Res Function(ForgetPasswordState) then) =
      _$ForgetPasswordStateCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress emailAddress,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});

  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$ForgetPasswordStateCopyWithImpl<$Res>
    implements $ForgetPasswordStateCopyWith<$Res> {
  _$ForgetPasswordStateCopyWithImpl(this._value, this._then);

  final ForgetPasswordState _value;
  // ignore: unused_field
  final $Res Function(ForgetPasswordState) _then;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }

  @override
  $ProcessingStatusCopyWith<$Res> get status {
    return $ProcessingStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$ForgetPasswordStateCopyWith<$Res>
    implements $ForgetPasswordStateCopyWith<$Res> {
  factory _$ForgetPasswordStateCopyWith(_ForgetPasswordState value,
          $Res Function(_ForgetPasswordState) then) =
      __$ForgetPasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress emailAddress,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});

  @override
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$ForgetPasswordStateCopyWithImpl<$Res>
    extends _$ForgetPasswordStateCopyWithImpl<$Res>
    implements _$ForgetPasswordStateCopyWith<$Res> {
  __$ForgetPasswordStateCopyWithImpl(
      _ForgetPasswordState _value, $Res Function(_ForgetPasswordState) _then)
      : super(_value, (v) => _then(v as _ForgetPasswordState));

  @override
  _ForgetPasswordState get _value => super._value as _ForgetPasswordState;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_ForgetPasswordState(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_ForgetPasswordState extends _ForgetPasswordState {
  _$_ForgetPasswordState(
      {required this.emailAddress,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      this.status = const ProcessingStatus.idle(),
      required this.failureOrSuccessOption})
      : super._();

  @override
  final EmailAddress emailAddress;
  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @JsonKey()
  @override
  final ProcessingStatus status;
  @override
  final Option<Either<AuthFailure, Unit>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ForgetPasswordState(emailAddress: $emailAddress, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, status: $status, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgetPasswordState &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccessOption, failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(failureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$ForgetPasswordStateCopyWith<_ForgetPasswordState> get copyWith =>
      __$ForgetPasswordStateCopyWithImpl<_ForgetPasswordState>(
          this, _$identity);
}

abstract class _ForgetPasswordState extends ForgetPasswordState {
  factory _ForgetPasswordState(
          {required EmailAddress emailAddress,
          bool isSubmitting,
          bool showErrorMessages,
          ProcessingStatus status,
          required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) =
      _$_ForgetPasswordState;
  _ForgetPasswordState._() : super._();

  @override
  EmailAddress get emailAddress;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  ProcessingStatus get status;
  @override
  Option<Either<AuthFailure, Unit>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$ForgetPasswordStateCopyWith<_ForgetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
