// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UpdateUserStateTearOff {
  const _$UpdateUserStateTearOff();

  _UpdateUserState call(
      {User? user,
      required Name name,
      required Phone phone,
      required Street street,
      required Gender gender,
      required BirthDay birthDay,
      required Password password,
      required Password confirmPassword,
      required EmailAddress emailAddress,
      bool remember = false,
      bool isSubmitting = false,
      bool displayPassword = false,
      bool showErrorMessages = true,
      ProcessingStatus status = STATUS_IDLE,
      required Option<Either<AuthFailure, Unit>>
          updateFailureOrSuccessOption}) {
    return _UpdateUserState(
      user: user,
      name: name,
      phone: phone,
      street: street,
      gender: gender,
      birthDay: birthDay,
      password: password,
      confirmPassword: confirmPassword,
      emailAddress: emailAddress,
      remember: remember,
      isSubmitting: isSubmitting,
      displayPassword: displayPassword,
      showErrorMessages: showErrorMessages,
      status: status,
      updateFailureOrSuccessOption: updateFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $UpdateUserState = _$UpdateUserStateTearOff();

/// @nodoc
mixin _$UpdateUserState {
  User? get user => throw _privateConstructorUsedError;
  Name get name => throw _privateConstructorUsedError;
  Phone get phone => throw _privateConstructorUsedError;
  Street get street => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  BirthDay get birthDay => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  Password get confirmPassword => throw _privateConstructorUsedError;
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  bool get remember => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get displayPassword => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get updateFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateUserStateCopyWith<UpdateUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserStateCopyWith<$Res> {
  factory $UpdateUserStateCopyWith(
          UpdateUserState value, $Res Function(UpdateUserState) then) =
      _$UpdateUserStateCopyWithImpl<$Res>;
  $Res call(
      {User? user,
      Name name,
      Phone phone,
      Street street,
      Gender gender,
      BirthDay birthDay,
      Password password,
      Password confirmPassword,
      EmailAddress emailAddress,
      bool remember,
      bool isSubmitting,
      bool displayPassword,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> updateFailureOrSuccessOption});

  $UserCopyWith<$Res>? get user;
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$UpdateUserStateCopyWithImpl<$Res>
    implements $UpdateUserStateCopyWith<$Res> {
  _$UpdateUserStateCopyWithImpl(this._value, this._then);

  final UpdateUserState _value;
  // ignore: unused_field
  final $Res Function(UpdateUserState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? street = freezed,
    Object? gender = freezed,
    Object? birthDay = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? emailAddress = freezed,
    Object? remember = freezed,
    Object? isSubmitting = freezed,
    Object? displayPassword = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? updateFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as Street,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      birthDay: birthDay == freezed
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as BirthDay,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
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
      updateFailureOrSuccessOption: updateFailureOrSuccessOption == freezed
          ? _value.updateFailureOrSuccessOption
          : updateFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $ProcessingStatusCopyWith<$Res> get status {
    return $ProcessingStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$UpdateUserStateCopyWith<$Res>
    implements $UpdateUserStateCopyWith<$Res> {
  factory _$UpdateUserStateCopyWith(
          _UpdateUserState value, $Res Function(_UpdateUserState) then) =
      __$UpdateUserStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {User? user,
      Name name,
      Phone phone,
      Street street,
      Gender gender,
      BirthDay birthDay,
      Password password,
      Password confirmPassword,
      EmailAddress emailAddress,
      bool remember,
      bool isSubmitting,
      bool displayPassword,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> updateFailureOrSuccessOption});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$UpdateUserStateCopyWithImpl<$Res>
    extends _$UpdateUserStateCopyWithImpl<$Res>
    implements _$UpdateUserStateCopyWith<$Res> {
  __$UpdateUserStateCopyWithImpl(
      _UpdateUserState _value, $Res Function(_UpdateUserState) _then)
      : super(_value, (v) => _then(v as _UpdateUserState));

  @override
  _UpdateUserState get _value => super._value as _UpdateUserState;

  @override
  $Res call({
    Object? user = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? street = freezed,
    Object? gender = freezed,
    Object? birthDay = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? emailAddress = freezed,
    Object? remember = freezed,
    Object? isSubmitting = freezed,
    Object? displayPassword = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? updateFailureOrSuccessOption = freezed,
  }) {
    return _then(_UpdateUserState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as Street,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      birthDay: birthDay == freezed
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as BirthDay,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
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
      updateFailureOrSuccessOption: updateFailureOrSuccessOption == freezed
          ? _value.updateFailureOrSuccessOption
          : updateFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_UpdateUserState extends _UpdateUserState {
  _$_UpdateUserState(
      {this.user,
      required this.name,
      required this.phone,
      required this.street,
      required this.gender,
      required this.birthDay,
      required this.password,
      required this.confirmPassword,
      required this.emailAddress,
      this.remember = false,
      this.isSubmitting = false,
      this.displayPassword = false,
      this.showErrorMessages = true,
      this.status = STATUS_IDLE,
      required this.updateFailureOrSuccessOption})
      : super._();

  @override
  final User? user;
  @override
  final Name name;
  @override
  final Phone phone;
  @override
  final Street street;
  @override
  final Gender gender;
  @override
  final BirthDay birthDay;
  @override
  final Password password;
  @override
  final Password confirmPassword;
  @override
  final EmailAddress emailAddress;
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
  final Option<Either<AuthFailure, Unit>> updateFailureOrSuccessOption;

  @override
  String toString() {
    return 'UpdateUserState(user: $user, name: $name, phone: $phone, street: $street, gender: $gender, birthDay: $birthDay, password: $password, confirmPassword: $confirmPassword, emailAddress: $emailAddress, remember: $remember, isSubmitting: $isSubmitting, displayPassword: $displayPassword, showErrorMessages: $showErrorMessages, status: $status, updateFailureOrSuccessOption: $updateFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateUserState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.street, street) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.birthDay, birthDay) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.confirmPassword, confirmPassword) &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality().equals(other.remember, remember) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.displayPassword, displayPassword) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(
                other.updateFailureOrSuccessOption,
                updateFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(street),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(birthDay),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(confirmPassword),
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(remember),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(displayPassword),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(updateFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$UpdateUserStateCopyWith<_UpdateUserState> get copyWith =>
      __$UpdateUserStateCopyWithImpl<_UpdateUserState>(this, _$identity);
}

abstract class _UpdateUserState extends UpdateUserState {
  factory _UpdateUserState(
      {User? user,
      required Name name,
      required Phone phone,
      required Street street,
      required Gender gender,
      required BirthDay birthDay,
      required Password password,
      required Password confirmPassword,
      required EmailAddress emailAddress,
      bool remember,
      bool isSubmitting,
      bool displayPassword,
      bool showErrorMessages,
      ProcessingStatus status,
      required Option<Either<AuthFailure, Unit>>
          updateFailureOrSuccessOption}) = _$_UpdateUserState;
  _UpdateUserState._() : super._();

  @override
  User? get user;
  @override
  Name get name;
  @override
  Phone get phone;
  @override
  Street get street;
  @override
  Gender get gender;
  @override
  BirthDay get birthDay;
  @override
  Password get password;
  @override
  Password get confirmPassword;
  @override
  EmailAddress get emailAddress;
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
  Option<Either<AuthFailure, Unit>> get updateFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$UpdateUserStateCopyWith<_UpdateUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
