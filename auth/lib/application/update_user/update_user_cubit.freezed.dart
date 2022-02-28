// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_user_cubit.dart';

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
      required EmailAddress emailAddress,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      ProcessingStatus status = STATUS_IDLE,
      required Option<User> userOption,
      required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) {
    return _UpdateUserState(
      user: user,
      name: name,
      phone: phone,
      street: street,
      gender: gender,
      birthDay: birthDay,
      emailAddress: emailAddress,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      status: status,
      userOption: userOption,
      failureOrSuccessOption: failureOrSuccessOption,
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
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<User> get userOption => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get failureOrSuccessOption =>
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
      EmailAddress emailAddress,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<User> userOption,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});

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
    Object? emailAddress = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? userOption = freezed,
    Object? failureOrSuccessOption = freezed,
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
      userOption: userOption == freezed
          ? _value.userOption
          : userOption // ignore: cast_nullable_to_non_nullable
              as Option<User>,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
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
      EmailAddress emailAddress,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<User> userOption,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});

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
    Object? emailAddress = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? userOption = freezed,
    Object? failureOrSuccessOption = freezed,
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
      userOption: userOption == freezed
          ? _value.userOption
          : userOption // ignore: cast_nullable_to_non_nullable
              as Option<User>,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
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
      required this.emailAddress,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      this.status = STATUS_IDLE,
      required this.userOption,
      required this.failureOrSuccessOption})
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
  final Option<User> userOption;
  @override
  final Option<Either<AuthFailure, Unit>> failureOrSuccessOption;

  @override
  String toString() {
    return 'UpdateUserState(user: $user, name: $name, phone: $phone, street: $street, gender: $gender, birthDay: $birthDay, emailAddress: $emailAddress, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, status: $status, userOption: $userOption, failureOrSuccessOption: $failureOrSuccessOption)';
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
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.userOption, userOption) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccessOption, failureOrSuccessOption));
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
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(userOption),
      const DeepCollectionEquality().hash(failureOrSuccessOption));

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
          required EmailAddress emailAddress,
          bool isSubmitting,
          bool showErrorMessages,
          ProcessingStatus status,
          required Option<User> userOption,
          required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) =
      _$_UpdateUserState;
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
  EmailAddress get emailAddress;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  ProcessingStatus get status;
  @override
  Option<User> get userOption;
  @override
  Option<Either<AuthFailure, Unit>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$UpdateUserStateCopyWith<_UpdateUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
