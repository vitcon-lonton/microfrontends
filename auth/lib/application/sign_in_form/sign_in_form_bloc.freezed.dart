// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInFormEventTearOff {
  const _$SignInFormEventTearOff();

  PhoneChanged phoneChanged(String phoneStr) {
    return PhoneChanged(
      phoneStr,
    );
  }

  EmailChanged emailChanged(String emailStr) {
    return EmailChanged(
      emailStr,
    );
  }

  ShowPasswordChanged showPasswordChanged(bool value) {
    return ShowPasswordChanged(
      value,
    );
  }

  PasswordChanged passwordChanged(String passwordStr) {
    return PasswordChanged(
      passwordStr,
    );
  }

  RegisterWithPhoneAndPasswordPressed registerWithPhoneAndPasswordPressed() {
    return const RegisterWithPhoneAndPasswordPressed();
  }

  SignInWithPhoneAndPasswordPressed signInWithPhoneAndPasswordPressed() {
    return const SignInWithPhoneAndPasswordPressed();
  }

  SignInWithGooglePressed signInWithGooglePressed() {
    return const SignInWithGooglePressed();
  }
}

/// @nodoc
const $SignInFormEvent = _$SignInFormEventTearOff();

/// @nodoc
mixin _$SignInFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(bool value) showPasswordChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerWithPhoneAndPasswordPressed,
    required TResult Function() signInWithPhoneAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(ShowPasswordChanged value) showPasswordChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithPhoneAndPasswordPressed value)
        registerWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithPhoneAndPasswordPressed value)
        signInWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithGooglePressed value)
        signInWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  final SignInFormEvent _value;
  // ignore: unused_field
  final $Res Function(SignInFormEvent) _then;
}

/// @nodoc
abstract class $PhoneChangedCopyWith<$Res> {
  factory $PhoneChangedCopyWith(
          PhoneChanged value, $Res Function(PhoneChanged) then) =
      _$PhoneChangedCopyWithImpl<$Res>;
  $Res call({String phoneStr});
}

/// @nodoc
class _$PhoneChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $PhoneChangedCopyWith<$Res> {
  _$PhoneChangedCopyWithImpl(
      PhoneChanged _value, $Res Function(PhoneChanged) _then)
      : super(_value, (v) => _then(v as PhoneChanged));

  @override
  PhoneChanged get _value => super._value as PhoneChanged;

  @override
  $Res call({
    Object? phoneStr = freezed,
  }) {
    return _then(PhoneChanged(
      phoneStr == freezed
          ? _value.phoneStr
          : phoneStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneChanged with DiagnosticableTreeMixin implements PhoneChanged {
  const _$PhoneChanged(this.phoneStr);

  @override
  final String phoneStr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.phoneChanged(phoneStr: $phoneStr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormEvent.phoneChanged'))
      ..add(DiagnosticsProperty('phoneStr', phoneStr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PhoneChanged &&
            const DeepCollectionEquality().equals(other.phoneStr, phoneStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(phoneStr));

  @JsonKey(ignore: true)
  @override
  $PhoneChangedCopyWith<PhoneChanged> get copyWith =>
      _$PhoneChangedCopyWithImpl<PhoneChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(bool value) showPasswordChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerWithPhoneAndPasswordPressed,
    required TResult Function() signInWithPhoneAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
  }) {
    return phoneChanged(phoneStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
  }) {
    return phoneChanged?.call(phoneStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(phoneStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(ShowPasswordChanged value) showPasswordChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithPhoneAndPasswordPressed value)
        registerWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithPhoneAndPasswordPressed value)
        signInWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithGooglePressed value)
        signInWithGooglePressed,
  }) {
    return phoneChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
  }) {
    return phoneChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(this);
    }
    return orElse();
  }
}

abstract class PhoneChanged implements SignInFormEvent {
  const factory PhoneChanged(String phoneStr) = _$PhoneChanged;

  String get phoneStr;
  @JsonKey(ignore: true)
  $PhoneChangedCopyWith<PhoneChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String emailStr});
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object? emailStr = freezed,
  }) {
    return _then(EmailChanged(
      emailStr == freezed
          ? _value.emailStr
          : emailStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChanged with DiagnosticableTreeMixin implements EmailChanged {
  const _$EmailChanged(this.emailStr);

  @override
  final String emailStr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.emailChanged(emailStr: $emailStr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormEvent.emailChanged'))
      ..add(DiagnosticsProperty('emailStr', emailStr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmailChanged &&
            const DeepCollectionEquality().equals(other.emailStr, emailStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(emailStr));

  @JsonKey(ignore: true)
  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(bool value) showPasswordChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerWithPhoneAndPasswordPressed,
    required TResult Function() signInWithPhoneAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
  }) {
    return emailChanged(emailStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
  }) {
    return emailChanged?.call(emailStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(emailStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(ShowPasswordChanged value) showPasswordChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithPhoneAndPasswordPressed value)
        registerWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithPhoneAndPasswordPressed value)
        signInWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithGooglePressed value)
        signInWithGooglePressed,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements SignInFormEvent {
  const factory EmailChanged(String emailStr) = _$EmailChanged;

  String get emailStr;
  @JsonKey(ignore: true)
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowPasswordChangedCopyWith<$Res> {
  factory $ShowPasswordChangedCopyWith(
          ShowPasswordChanged value, $Res Function(ShowPasswordChanged) then) =
      _$ShowPasswordChangedCopyWithImpl<$Res>;
  $Res call({bool value});
}

/// @nodoc
class _$ShowPasswordChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $ShowPasswordChangedCopyWith<$Res> {
  _$ShowPasswordChangedCopyWithImpl(
      ShowPasswordChanged _value, $Res Function(ShowPasswordChanged) _then)
      : super(_value, (v) => _then(v as ShowPasswordChanged));

  @override
  ShowPasswordChanged get _value => super._value as ShowPasswordChanged;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(ShowPasswordChanged(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShowPasswordChanged
    with DiagnosticableTreeMixin
    implements ShowPasswordChanged {
  const _$ShowPasswordChanged(this.value);

  @override
  final bool value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.showPasswordChanged(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormEvent.showPasswordChanged'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowPasswordChanged &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $ShowPasswordChangedCopyWith<ShowPasswordChanged> get copyWith =>
      _$ShowPasswordChangedCopyWithImpl<ShowPasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(bool value) showPasswordChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerWithPhoneAndPasswordPressed,
    required TResult Function() signInWithPhoneAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
  }) {
    return showPasswordChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
  }) {
    return showPasswordChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (showPasswordChanged != null) {
      return showPasswordChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(ShowPasswordChanged value) showPasswordChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithPhoneAndPasswordPressed value)
        registerWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithPhoneAndPasswordPressed value)
        signInWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithGooglePressed value)
        signInWithGooglePressed,
  }) {
    return showPasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
  }) {
    return showPasswordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (showPasswordChanged != null) {
      return showPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class ShowPasswordChanged implements SignInFormEvent {
  const factory ShowPasswordChanged(bool value) = _$ShowPasswordChanged;

  bool get value;
  @JsonKey(ignore: true)
  $ShowPasswordChangedCopyWith<ShowPasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String passwordStr});
}

/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;

  @override
  $Res call({
    Object? passwordStr = freezed,
  }) {
    return _then(PasswordChanged(
      passwordStr == freezed
          ? _value.passwordStr
          : passwordStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChanged
    with DiagnosticableTreeMixin
    implements PasswordChanged {
  const _$PasswordChanged(this.passwordStr);

  @override
  final String passwordStr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.passwordChanged(passwordStr: $passwordStr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormEvent.passwordChanged'))
      ..add(DiagnosticsProperty('passwordStr', passwordStr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PasswordChanged &&
            const DeepCollectionEquality()
                .equals(other.passwordStr, passwordStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(passwordStr));

  @JsonKey(ignore: true)
  @override
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(bool value) showPasswordChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerWithPhoneAndPasswordPressed,
    required TResult Function() signInWithPhoneAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
  }) {
    return passwordChanged(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
  }) {
    return passwordChanged?.call(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(passwordStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(ShowPasswordChanged value) showPasswordChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithPhoneAndPasswordPressed value)
        registerWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithPhoneAndPasswordPressed value)
        signInWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithGooglePressed value)
        signInWithGooglePressed,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements SignInFormEvent {
  const factory PasswordChanged(String passwordStr) = _$PasswordChanged;

  String get passwordStr;
  @JsonKey(ignore: true)
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterWithPhoneAndPasswordPressedCopyWith<$Res> {
  factory $RegisterWithPhoneAndPasswordPressedCopyWith(
          RegisterWithPhoneAndPasswordPressed value,
          $Res Function(RegisterWithPhoneAndPasswordPressed) then) =
      _$RegisterWithPhoneAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterWithPhoneAndPasswordPressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $RegisterWithPhoneAndPasswordPressedCopyWith<$Res> {
  _$RegisterWithPhoneAndPasswordPressedCopyWithImpl(
      RegisterWithPhoneAndPasswordPressed _value,
      $Res Function(RegisterWithPhoneAndPasswordPressed) _then)
      : super(_value, (v) => _then(v as RegisterWithPhoneAndPasswordPressed));

  @override
  RegisterWithPhoneAndPasswordPressed get _value =>
      super._value as RegisterWithPhoneAndPasswordPressed;
}

/// @nodoc

class _$RegisterWithPhoneAndPasswordPressed
    with DiagnosticableTreeMixin
    implements RegisterWithPhoneAndPasswordPressed {
  const _$RegisterWithPhoneAndPasswordPressed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.registerWithPhoneAndPasswordPressed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SignInFormEvent.registerWithPhoneAndPasswordPressed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterWithPhoneAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(bool value) showPasswordChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerWithPhoneAndPasswordPressed,
    required TResult Function() signInWithPhoneAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
  }) {
    return registerWithPhoneAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
  }) {
    return registerWithPhoneAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (registerWithPhoneAndPasswordPressed != null) {
      return registerWithPhoneAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(ShowPasswordChanged value) showPasswordChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithPhoneAndPasswordPressed value)
        registerWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithPhoneAndPasswordPressed value)
        signInWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithGooglePressed value)
        signInWithGooglePressed,
  }) {
    return registerWithPhoneAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
  }) {
    return registerWithPhoneAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (registerWithPhoneAndPasswordPressed != null) {
      return registerWithPhoneAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class RegisterWithPhoneAndPasswordPressed implements SignInFormEvent {
  const factory RegisterWithPhoneAndPasswordPressed() =
      _$RegisterWithPhoneAndPasswordPressed;
}

/// @nodoc
abstract class $SignInWithPhoneAndPasswordPressedCopyWith<$Res> {
  factory $SignInWithPhoneAndPasswordPressedCopyWith(
          SignInWithPhoneAndPasswordPressed value,
          $Res Function(SignInWithPhoneAndPasswordPressed) then) =
      _$SignInWithPhoneAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithPhoneAndPasswordPressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInWithPhoneAndPasswordPressedCopyWith<$Res> {
  _$SignInWithPhoneAndPasswordPressedCopyWithImpl(
      SignInWithPhoneAndPasswordPressed _value,
      $Res Function(SignInWithPhoneAndPasswordPressed) _then)
      : super(_value, (v) => _then(v as SignInWithPhoneAndPasswordPressed));

  @override
  SignInWithPhoneAndPasswordPressed get _value =>
      super._value as SignInWithPhoneAndPasswordPressed;
}

/// @nodoc

class _$SignInWithPhoneAndPasswordPressed
    with DiagnosticableTreeMixin
    implements SignInWithPhoneAndPasswordPressed {
  const _$SignInWithPhoneAndPasswordPressed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.signInWithPhoneAndPasswordPressed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SignInFormEvent.signInWithPhoneAndPasswordPressed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInWithPhoneAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(bool value) showPasswordChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerWithPhoneAndPasswordPressed,
    required TResult Function() signInWithPhoneAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
  }) {
    return signInWithPhoneAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
  }) {
    return signInWithPhoneAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (signInWithPhoneAndPasswordPressed != null) {
      return signInWithPhoneAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(ShowPasswordChanged value) showPasswordChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithPhoneAndPasswordPressed value)
        registerWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithPhoneAndPasswordPressed value)
        signInWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithGooglePressed value)
        signInWithGooglePressed,
  }) {
    return signInWithPhoneAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
  }) {
    return signInWithPhoneAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (signInWithPhoneAndPasswordPressed != null) {
      return signInWithPhoneAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class SignInWithPhoneAndPasswordPressed implements SignInFormEvent {
  const factory SignInWithPhoneAndPasswordPressed() =
      _$SignInWithPhoneAndPasswordPressed;
}

/// @nodoc
abstract class $SignInWithGooglePressedCopyWith<$Res> {
  factory $SignInWithGooglePressedCopyWith(SignInWithGooglePressed value,
          $Res Function(SignInWithGooglePressed) then) =
      _$SignInWithGooglePressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithGooglePressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInWithGooglePressedCopyWith<$Res> {
  _$SignInWithGooglePressedCopyWithImpl(SignInWithGooglePressed _value,
      $Res Function(SignInWithGooglePressed) _then)
      : super(_value, (v) => _then(v as SignInWithGooglePressed));

  @override
  SignInWithGooglePressed get _value => super._value as SignInWithGooglePressed;
}

/// @nodoc

class _$SignInWithGooglePressed
    with DiagnosticableTreeMixin
    implements SignInWithGooglePressed {
  const _$SignInWithGooglePressed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormEvent.signInWithGooglePressed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SignInFormEvent.signInWithGooglePressed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInWithGooglePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(bool value) showPasswordChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() registerWithPhoneAndPasswordPressed,
    required TResult Function() signInWithPhoneAndPasswordPressed,
    required TResult Function() signInWithGooglePressed,
  }) {
    return signInWithGooglePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
  }) {
    return signInWithGooglePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(bool value)? showPasswordChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? registerWithPhoneAndPasswordPressed,
    TResult Function()? signInWithPhoneAndPasswordPressed,
    TResult Function()? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (signInWithGooglePressed != null) {
      return signInWithGooglePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(ShowPasswordChanged value) showPasswordChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithPhoneAndPasswordPressed value)
        registerWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithPhoneAndPasswordPressed value)
        signInWithPhoneAndPasswordPressed,
    required TResult Function(SignInWithGooglePressed value)
        signInWithGooglePressed,
  }) {
    return signInWithGooglePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
  }) {
    return signInWithGooglePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(ShowPasswordChanged value)? showPasswordChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithPhoneAndPasswordPressed value)?
        registerWithPhoneAndPasswordPressed,
    TResult Function(SignInWithPhoneAndPasswordPressed value)?
        signInWithPhoneAndPasswordPressed,
    TResult Function(SignInWithGooglePressed value)? signInWithGooglePressed,
    required TResult orElse(),
  }) {
    if (signInWithGooglePressed != null) {
      return signInWithGooglePressed(this);
    }
    return orElse();
  }
}

abstract class SignInWithGooglePressed implements SignInFormEvent {
  const factory SignInWithGooglePressed() = _$SignInWithGooglePressed;
}

/// @nodoc
class _$SignInFormStateTearOff {
  const _$SignInFormStateTearOff();

  _SignInFormState call(
      {required Phone phone,
      required Password password,
      required EmailAddress emailAddress,
      bool showPassword = false,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) {
    return _SignInFormState(
      phone: phone,
      password: password,
      emailAddress: emailAddress,
      showPassword: showPassword,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $SignInFormState = _$SignInFormStateTearOff();

/// @nodoc
mixin _$SignInFormState {
  Phone get phone => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInFormStateCopyWith<SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res>;
  $Res call(
      {Phone phone,
      Password password,
      EmailAddress emailAddress,
      bool showPassword,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  final SignInFormState _value;
  // ignore: unused_field
  final $Res Function(SignInFormState) _then;

  @override
  $Res call({
    Object? phone = freezed,
    Object? password = freezed,
    Object? emailAddress = freezed,
    Object? showPassword = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? authFailureOrSuccessOption = freezed,
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
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      showPassword: showPassword == freezed
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$SignInFormStateCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$SignInFormStateCopyWith(
          _SignInFormState value, $Res Function(_SignInFormState) then) =
      __$SignInFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Phone phone,
      Password password,
      EmailAddress emailAddress,
      bool showPassword,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$SignInFormStateCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res>
    implements _$SignInFormStateCopyWith<$Res> {
  __$SignInFormStateCopyWithImpl(
      _SignInFormState _value, $Res Function(_SignInFormState) _then)
      : super(_value, (v) => _then(v as _SignInFormState));

  @override
  _SignInFormState get _value => super._value as _SignInFormState;

  @override
  $Res call({
    Object? phone = freezed,
    Object? password = freezed,
    Object? emailAddress = freezed,
    Object? showPassword = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_SignInFormState(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      showPassword: showPassword == freezed
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_SignInFormState
    with DiagnosticableTreeMixin
    implements _SignInFormState {
  const _$_SignInFormState(
      {required this.phone,
      required this.password,
      required this.emailAddress,
      this.showPassword = false,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      required this.authFailureOrSuccessOption});

  @override
  final Phone phone;
  @override
  final Password password;
  @override
  final EmailAddress emailAddress;
  @JsonKey()
  @override
  final bool showPassword;
  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInFormState(phone: $phone, password: $password, emailAddress: $emailAddress, showPassword: $showPassword, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInFormState'))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('emailAddress', emailAddress))
      ..add(DiagnosticsProperty('showPassword', showPassword))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('showErrorMessages', showErrorMessages))
      ..add(DiagnosticsProperty(
          'authFailureOrSuccessOption', authFailureOrSuccessOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInFormState &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality()
                .equals(other.showPassword, showPassword) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(showPassword),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith =>
      __$SignInFormStateCopyWithImpl<_SignInFormState>(this, _$identity);
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState(
      {required Phone phone,
      required Password password,
      required EmailAddress emailAddress,
      bool showPassword,
      bool isSubmitting,
      bool showErrorMessages,
      required Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$_SignInFormState;

  @override
  Phone get phone;
  @override
  Password get password;
  @override
  EmailAddress get emailAddress;
  @override
  bool get showPassword;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
