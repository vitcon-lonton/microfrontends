// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'password_change_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PasswordChangeStateTearOff {
  const _$PasswordChangeStateTearOff();

  _PasswordChangeState call(
      {required Phone phone,
      required Password password,
      required Password confirmPassword,
      bool displayPassword = false,
      bool displayConfirmPassword = false,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      ProcessingStatus status = STATUS_IDLE,
      required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) {
    return _PasswordChangeState(
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
      displayPassword: displayPassword,
      displayConfirmPassword: displayConfirmPassword,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      status: status,
      failureOrSuccessOption: failureOrSuccessOption,
    );
  }
}

/// @nodoc
const $PasswordChangeState = _$PasswordChangeStateTearOff();

/// @nodoc
mixin _$PasswordChangeState {
  Phone get phone => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  Password get confirmPassword => throw _privateConstructorUsedError;
  bool get displayPassword => throw _privateConstructorUsedError;
  bool get displayConfirmPassword => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordChangeStateCopyWith<PasswordChangeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordChangeStateCopyWith<$Res> {
  factory $PasswordChangeStateCopyWith(
          PasswordChangeState value, $Res Function(PasswordChangeState) then) =
      _$PasswordChangeStateCopyWithImpl<$Res>;
  $Res call(
      {Phone phone,
      Password password,
      Password confirmPassword,
      bool displayPassword,
      bool displayConfirmPassword,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});

  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$PasswordChangeStateCopyWithImpl<$Res>
    implements $PasswordChangeStateCopyWith<$Res> {
  _$PasswordChangeStateCopyWithImpl(this._value, this._then);

  final PasswordChangeState _value;
  // ignore: unused_field
  final $Res Function(PasswordChangeState) _then;

  @override
  $Res call({
    Object? phone = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? displayPassword = freezed,
    Object? displayConfirmPassword = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      displayPassword: displayPassword == freezed
          ? _value.displayPassword
          : displayPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      displayConfirmPassword: displayConfirmPassword == freezed
          ? _value.displayConfirmPassword
          : displayConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$PasswordChangeStateCopyWith<$Res>
    implements $PasswordChangeStateCopyWith<$Res> {
  factory _$PasswordChangeStateCopyWith(_PasswordChangeState value,
          $Res Function(_PasswordChangeState) then) =
      __$PasswordChangeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Phone phone,
      Password password,
      Password confirmPassword,
      bool displayPassword,
      bool displayConfirmPassword,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});

  @override
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$PasswordChangeStateCopyWithImpl<$Res>
    extends _$PasswordChangeStateCopyWithImpl<$Res>
    implements _$PasswordChangeStateCopyWith<$Res> {
  __$PasswordChangeStateCopyWithImpl(
      _PasswordChangeState _value, $Res Function(_PasswordChangeState) _then)
      : super(_value, (v) => _then(v as _PasswordChangeState));

  @override
  _PasswordChangeState get _value => super._value as _PasswordChangeState;

  @override
  $Res call({
    Object? phone = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? displayPassword = freezed,
    Object? displayConfirmPassword = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_PasswordChangeState(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      displayPassword: displayPassword == freezed
          ? _value.displayPassword
          : displayPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      displayConfirmPassword: displayConfirmPassword == freezed
          ? _value.displayConfirmPassword
          : displayConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$_PasswordChangeState extends _PasswordChangeState {
  _$_PasswordChangeState(
      {required this.phone,
      required this.password,
      required this.confirmPassword,
      this.displayPassword = false,
      this.displayConfirmPassword = false,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      this.status = STATUS_IDLE,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final Phone phone;
  @override
  final Password password;
  @override
  final Password confirmPassword;
  @JsonKey()
  @override
  final bool displayPassword;
  @JsonKey()
  @override
  final bool displayConfirmPassword;
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
    return 'PasswordChangeState(phone: $phone, password: $password, confirmPassword: $confirmPassword, displayPassword: $displayPassword, displayConfirmPassword: $displayConfirmPassword, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, status: $status, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PasswordChangeState &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.confirmPassword, confirmPassword) &&
            const DeepCollectionEquality()
                .equals(other.displayPassword, displayPassword) &&
            const DeepCollectionEquality()
                .equals(other.displayConfirmPassword, displayConfirmPassword) &&
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
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(confirmPassword),
      const DeepCollectionEquality().hash(displayPassword),
      const DeepCollectionEquality().hash(displayConfirmPassword),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(failureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$PasswordChangeStateCopyWith<_PasswordChangeState> get copyWith =>
      __$PasswordChangeStateCopyWithImpl<_PasswordChangeState>(
          this, _$identity);
}

abstract class _PasswordChangeState extends PasswordChangeState {
  factory _PasswordChangeState(
          {required Phone phone,
          required Password password,
          required Password confirmPassword,
          bool displayPassword,
          bool displayConfirmPassword,
          bool isSubmitting,
          bool showErrorMessages,
          ProcessingStatus status,
          required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) =
      _$_PasswordChangeState;
  _PasswordChangeState._() : super._();

  @override
  Phone get phone;
  @override
  Password get password;
  @override
  Password get confirmPassword;
  @override
  bool get displayPassword;
  @override
  bool get displayConfirmPassword;
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
  _$PasswordChangeStateCopyWith<_PasswordChangeState> get copyWith =>
      throw _privateConstructorUsedError;
}
