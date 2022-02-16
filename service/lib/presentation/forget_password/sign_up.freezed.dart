// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpStateTearOff {
  const _$SignUpStateTearOff();

  _SignUpState call(
      {required Email email,
      required Password password,
      required Password confirmPassword,
      bool remember = false,
      bool displayPassword = false,
      AsyncStatus status = const AsyncStatus.idle()}) {
    return _SignUpState(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      remember: remember,
      displayPassword: displayPassword,
      status: status,
    );
  }
}

/// @nodoc
const $SignUpState = _$SignUpStateTearOff();

/// @nodoc
mixin _$SignUpState {
  Email get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  Password get confirmPassword => throw _privateConstructorUsedError;
  bool get remember => throw _privateConstructorUsedError;
  bool get displayPassword => throw _privateConstructorUsedError;
  AsyncStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res>;
  $Res call(
      {Email email,
      Password password,
      Password confirmPassword,
      bool remember,
      bool displayPassword,
      AsyncStatus status});

  $AsyncStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  final SignUpState _value;
  // ignore: unused_field
  final $Res Function(SignUpState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? remember = freezed,
    Object? displayPassword = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
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
      displayPassword: displayPassword == freezed
          ? _value.displayPassword
          : displayPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncStatus,
    ));
  }

  @override
  $AsyncStatusCopyWith<$Res> get status {
    return $AsyncStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(
          _SignUpState value, $Res Function(_SignUpState) then) =
      __$SignUpStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Email email,
      Password password,
      Password confirmPassword,
      bool remember,
      bool displayPassword,
      AsyncStatus status});

  @override
  $AsyncStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$SignUpStateCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
    implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(
      _SignUpState _value, $Res Function(_SignUpState) _then)
      : super(_value, (v) => _then(v as _SignUpState));

  @override
  _SignUpState get _value => super._value as _SignUpState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? remember = freezed,
    Object? displayPassword = freezed,
    Object? status = freezed,
  }) {
    return _then(_SignUpState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
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
      displayPassword: displayPassword == freezed
          ? _value.displayPassword
          : displayPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncStatus,
    ));
  }
}

/// @nodoc

class _$_SignUpState extends _SignUpState {
  _$_SignUpState(
      {required this.email,
      required this.password,
      required this.confirmPassword,
      this.remember = false,
      this.displayPassword = false,
      this.status = const AsyncStatus.idle()})
      : super._();

  @override
  final Email email;
  @override
  final Password password;
  @override
  final Password confirmPassword;
  @JsonKey(defaultValue: false)
  @override
  final bool remember;
  @JsonKey(defaultValue: false)
  @override
  final bool displayPassword;
  @JsonKey(defaultValue: const AsyncStatus.idle())
  @override
  final AsyncStatus status;

  @override
  String toString() {
    return 'SignUpState(email: $email, password: $password, confirmPassword: $confirmPassword, remember: $remember, displayPassword: $displayPassword, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.confirmPassword, confirmPassword) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPassword, confirmPassword)) &&
            (identical(other.remember, remember) ||
                const DeepCollectionEquality()
                    .equals(other.remember, remember)) &&
            (identical(other.displayPassword, displayPassword) ||
                const DeepCollectionEquality()
                    .equals(other.displayPassword, displayPassword)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(confirmPassword) ^
      const DeepCollectionEquality().hash(remember) ^
      const DeepCollectionEquality().hash(displayPassword) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$SignUpStateCopyWith<_SignUpState> get copyWith =>
      __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);
}

abstract class _SignUpState extends SignUpState {
  factory _SignUpState(
      {required Email email,
      required Password password,
      required Password confirmPassword,
      bool remember,
      bool displayPassword,
      AsyncStatus status}) = _$_SignUpState;
  _SignUpState._() : super._();

  @override
  Email get email => throw _privateConstructorUsedError;
  @override
  Password get password => throw _privateConstructorUsedError;
  @override
  Password get confirmPassword => throw _privateConstructorUsedError;
  @override
  bool get remember => throw _privateConstructorUsedError;
  @override
  bool get displayPassword => throw _privateConstructorUsedError;
  @override
  AsyncStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignUpStateCopyWith<_SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
