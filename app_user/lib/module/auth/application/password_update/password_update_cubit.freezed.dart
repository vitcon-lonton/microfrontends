// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'password_update_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PasswordUpdateStateTearOff {
  const _$PasswordUpdateStateTearOff();

  _PasswordUpdateState call(
      {required Password password,
      required Password newPassword,
      required Password confirmPassword,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      bool displayPassword = false,
      bool displayNewPassword = false,
      bool displayConfirmPassword = false,
      ProcessingStatus status = STATUS_IDLE,
      required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) {
    return _PasswordUpdateState(
      password: password,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      displayPassword: displayPassword,
      displayNewPassword: displayNewPassword,
      displayConfirmPassword: displayConfirmPassword,
      status: status,
      failureOrSuccessOption: failureOrSuccessOption,
    );
  }
}

/// @nodoc
const $PasswordUpdateState = _$PasswordUpdateStateTearOff();

/// @nodoc
mixin _$PasswordUpdateState {
  Password get password => throw _privateConstructorUsedError;
  Password get newPassword => throw _privateConstructorUsedError;
  Password get confirmPassword => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get displayPassword => throw _privateConstructorUsedError;
  bool get displayNewPassword => throw _privateConstructorUsedError;
  bool get displayConfirmPassword => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordUpdateStateCopyWith<PasswordUpdateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordUpdateStateCopyWith<$Res> {
  factory $PasswordUpdateStateCopyWith(
          PasswordUpdateState value, $Res Function(PasswordUpdateState) then) =
      _$PasswordUpdateStateCopyWithImpl<$Res>;
  $Res call(
      {Password password,
      Password newPassword,
      Password confirmPassword,
      bool isSubmitting,
      bool showErrorMessages,
      bool displayPassword,
      bool displayNewPassword,
      bool displayConfirmPassword,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});

  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$PasswordUpdateStateCopyWithImpl<$Res>
    implements $PasswordUpdateStateCopyWith<$Res> {
  _$PasswordUpdateStateCopyWithImpl(this._value, this._then);

  final PasswordUpdateState _value;
  // ignore: unused_field
  final $Res Function(PasswordUpdateState) _then;

  @override
  $Res call({
    Object? password = freezed,
    Object? newPassword = freezed,
    Object? confirmPassword = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? displayPassword = freezed,
    Object? displayNewPassword = freezed,
    Object? displayConfirmPassword = freezed,
    Object? status = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      displayPassword: displayPassword == freezed
          ? _value.displayPassword
          : displayPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      displayNewPassword: displayNewPassword == freezed
          ? _value.displayNewPassword
          : displayNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      displayConfirmPassword: displayConfirmPassword == freezed
          ? _value.displayConfirmPassword
          : displayConfirmPassword // ignore: cast_nullable_to_non_nullable
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
abstract class _$PasswordUpdateStateCopyWith<$Res>
    implements $PasswordUpdateStateCopyWith<$Res> {
  factory _$PasswordUpdateStateCopyWith(_PasswordUpdateState value,
          $Res Function(_PasswordUpdateState) then) =
      __$PasswordUpdateStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Password password,
      Password newPassword,
      Password confirmPassword,
      bool isSubmitting,
      bool showErrorMessages,
      bool displayPassword,
      bool displayNewPassword,
      bool displayConfirmPassword,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});

  @override
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$PasswordUpdateStateCopyWithImpl<$Res>
    extends _$PasswordUpdateStateCopyWithImpl<$Res>
    implements _$PasswordUpdateStateCopyWith<$Res> {
  __$PasswordUpdateStateCopyWithImpl(
      _PasswordUpdateState _value, $Res Function(_PasswordUpdateState) _then)
      : super(_value, (v) => _then(v as _PasswordUpdateState));

  @override
  _PasswordUpdateState get _value => super._value as _PasswordUpdateState;

  @override
  $Res call({
    Object? password = freezed,
    Object? newPassword = freezed,
    Object? confirmPassword = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? displayPassword = freezed,
    Object? displayNewPassword = freezed,
    Object? displayConfirmPassword = freezed,
    Object? status = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_PasswordUpdateState(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      displayPassword: displayPassword == freezed
          ? _value.displayPassword
          : displayPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      displayNewPassword: displayNewPassword == freezed
          ? _value.displayNewPassword
          : displayNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      displayConfirmPassword: displayConfirmPassword == freezed
          ? _value.displayConfirmPassword
          : displayConfirmPassword // ignore: cast_nullable_to_non_nullable
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

class _$_PasswordUpdateState extends _PasswordUpdateState {
  _$_PasswordUpdateState(
      {required this.password,
      required this.newPassword,
      required this.confirmPassword,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      this.displayPassword = false,
      this.displayNewPassword = false,
      this.displayConfirmPassword = false,
      this.status = STATUS_IDLE,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final Password password;
  @override
  final Password newPassword;
  @override
  final Password confirmPassword;
  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @JsonKey()
  @override
  final bool displayPassword;
  @JsonKey()
  @override
  final bool displayNewPassword;
  @JsonKey()
  @override
  final bool displayConfirmPassword;
  @JsonKey()
  @override
  final ProcessingStatus status;
  @override
  final Option<Either<AuthFailure, Unit>> failureOrSuccessOption;

  @override
  String toString() {
    return 'PasswordUpdateState(password: $password, newPassword: $newPassword, confirmPassword: $confirmPassword, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, displayPassword: $displayPassword, displayNewPassword: $displayNewPassword, displayConfirmPassword: $displayConfirmPassword, status: $status, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PasswordUpdateState &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.newPassword, newPassword) &&
            const DeepCollectionEquality()
                .equals(other.confirmPassword, confirmPassword) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.displayPassword, displayPassword) &&
            const DeepCollectionEquality()
                .equals(other.displayNewPassword, displayNewPassword) &&
            const DeepCollectionEquality()
                .equals(other.displayConfirmPassword, displayConfirmPassword) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccessOption, failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(newPassword),
      const DeepCollectionEquality().hash(confirmPassword),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(displayPassword),
      const DeepCollectionEquality().hash(displayNewPassword),
      const DeepCollectionEquality().hash(displayConfirmPassword),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(failureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$PasswordUpdateStateCopyWith<_PasswordUpdateState> get copyWith =>
      __$PasswordUpdateStateCopyWithImpl<_PasswordUpdateState>(
          this, _$identity);
}

abstract class _PasswordUpdateState extends PasswordUpdateState {
  factory _PasswordUpdateState(
          {required Password password,
          required Password newPassword,
          required Password confirmPassword,
          bool isSubmitting,
          bool showErrorMessages,
          bool displayPassword,
          bool displayNewPassword,
          bool displayConfirmPassword,
          ProcessingStatus status,
          required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) =
      _$_PasswordUpdateState;
  _PasswordUpdateState._() : super._();

  @override
  Password get password;
  @override
  Password get newPassword;
  @override
  Password get confirmPassword;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  bool get displayPassword;
  @override
  bool get displayNewPassword;
  @override
  bool get displayConfirmPassword;
  @override
  ProcessingStatus get status;
  @override
  Option<Either<AuthFailure, Unit>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$PasswordUpdateStateCopyWith<_PasswordUpdateState> get copyWith =>
      throw _privateConstructorUsedError;
}
