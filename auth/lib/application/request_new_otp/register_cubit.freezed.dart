// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisterStateTearOff {
  const _$RegisterStateTearOff();

  _RegisterState call(
      {required EmailAddress emailAddress,
      required Password password,
      required Password confirmPassword,
      bool remember = false,
      bool isSubmitting = false,
      bool displayPassword = false,
      bool showErrorMessages = true,
      ProcessingStatus status = const ProcessingStatus.idle(),
      required Option<Either<AuthFailure, Unit>>
          registerFailureOrSuccessOption}) {
    return _RegisterState(
      emailAddress: emailAddress,
      password: password,
      confirmPassword: confirmPassword,
      remember: remember,
      isSubmitting: isSubmitting,
      displayPassword: displayPassword,
      showErrorMessages: showErrorMessages,
      status: status,
      registerFailureOrSuccessOption: registerFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $RegisterState = _$RegisterStateTearOff();

/// @nodoc
mixin _$RegisterState {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  Password get confirmPassword => throw _privateConstructorUsedError;
  bool get remember => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get displayPassword => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get registerFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      Password confirmPassword,
      bool remember,
      bool isSubmitting,
      bool displayPassword,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> registerFailureOrSuccessOption});

  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  final RegisterState _value;
  // ignore: unused_field
  final $Res Function(RegisterState) _then;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? remember = freezed,
    Object? isSubmitting = freezed,
    Object? displayPassword = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? registerFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      remember: remember == freezed
          ? _value.remember
          : remember // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      displayPassword: displayPassword == freezed
          ? _value.displayPassword
          : displayPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      registerFailureOrSuccessOption: registerFailureOrSuccessOption == freezed
          ? _value.registerFailureOrSuccessOption
          : registerFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
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
abstract class _$RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(
          _RegisterState value, $Res Function(_RegisterState) then) =
      __$RegisterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress emailAddress,
      Password password,
      Password confirmPassword,
      bool remember,
      bool isSubmitting,
      bool displayPassword,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> registerFailureOrSuccessOption});

  @override
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(
      _RegisterState _value, $Res Function(_RegisterState) _then)
      : super(_value, (v) => _then(v as _RegisterState));

  @override
  _RegisterState get _value => super._value as _RegisterState;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? remember = freezed,
    Object? isSubmitting = freezed,
    Object? displayPassword = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? registerFailureOrSuccessOption = freezed,
  }) {
    return _then(_RegisterState(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      remember: remember == freezed
          ? _value.remember
          : remember // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      displayPassword: displayPassword == freezed
          ? _value.displayPassword
          : displayPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      registerFailureOrSuccessOption: registerFailureOrSuccessOption == freezed
          ? _value.registerFailureOrSuccessOption
          : registerFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_RegisterState extends _RegisterState {
  _$_RegisterState(
      {required this.emailAddress,
      required this.password,
      required this.confirmPassword,
      this.remember = false,
      this.isSubmitting = false,
      this.displayPassword = false,
      this.showErrorMessages = true,
      this.status = const ProcessingStatus.idle(),
      required this.registerFailureOrSuccessOption})
      : super._();

  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final Password confirmPassword;
  @JsonKey()
  @override
  final bool remember;
  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool displayPassword;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @JsonKey()
  @override
  final ProcessingStatus status;
  @override
  final Option<Either<AuthFailure, Unit>> registerFailureOrSuccessOption;

  @override
  String toString() {
    return 'RegisterState(emailAddress: $emailAddress, password: $password, confirmPassword: $confirmPassword, remember: $remember, isSubmitting: $isSubmitting, displayPassword: $displayPassword, showErrorMessages: $showErrorMessages, status: $status, registerFailureOrSuccessOption: $registerFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterState &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.confirmPassword, confirmPassword) &&
            const DeepCollectionEquality().equals(other.remember, remember) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.displayPassword, displayPassword) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(
                other.registerFailureOrSuccessOption,
                registerFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(confirmPassword),
      const DeepCollectionEquality().hash(remember),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(displayPassword),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(registerFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);
}

abstract class _RegisterState extends RegisterState {
  factory _RegisterState(
      {required EmailAddress emailAddress,
      required Password password,
      required Password confirmPassword,
      bool remember,
      bool isSubmitting,
      bool displayPassword,
      bool showErrorMessages,
      ProcessingStatus status,
      required Option<Either<AuthFailure, Unit>>
          registerFailureOrSuccessOption}) = _$_RegisterState;
  _RegisterState._() : super._();

  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  Password get confirmPassword;
  @override
  bool get remember;
  @override
  bool get isSubmitting;
  @override
  bool get displayPassword;
  @override
  bool get showErrorMessages;
  @override
  ProcessingStatus get status;
  @override
  Option<Either<AuthFailure, Unit>> get registerFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
