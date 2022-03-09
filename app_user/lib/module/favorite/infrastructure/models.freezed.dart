// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginData _$LoginDataFromJson(Map<String, dynamic> json) {
  return _LoginData.fromJson(json);
}

/// @nodoc
class _$LoginDataTearOff {
  const _$LoginDataTearOff();

  _LoginData call({required String loginkey, required String password}) {
    return _LoginData(
      loginkey: loginkey,
      password: password,
    );
  }

  LoginData fromJson(Map<String, Object?> json) {
    return LoginData.fromJson(json);
  }
}

/// @nodoc
const $LoginData = _$LoginDataTearOff();

/// @nodoc
mixin _$LoginData {
  String get loginkey => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDataCopyWith<LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataCopyWith<$Res> {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) then) =
      _$LoginDataCopyWithImpl<$Res>;
  $Res call({String loginkey, String password});
}

/// @nodoc
class _$LoginDataCopyWithImpl<$Res> implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._value, this._then);

  final LoginData _value;
  // ignore: unused_field
  final $Res Function(LoginData) _then;

  @override
  $Res call({
    Object? loginkey = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      loginkey: loginkey == freezed
          ? _value.loginkey
          : loginkey // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginDataCopyWith<$Res> implements $LoginDataCopyWith<$Res> {
  factory _$LoginDataCopyWith(
          _LoginData value, $Res Function(_LoginData) then) =
      __$LoginDataCopyWithImpl<$Res>;
  @override
  $Res call({String loginkey, String password});
}

/// @nodoc
class __$LoginDataCopyWithImpl<$Res> extends _$LoginDataCopyWithImpl<$Res>
    implements _$LoginDataCopyWith<$Res> {
  __$LoginDataCopyWithImpl(_LoginData _value, $Res Function(_LoginData) _then)
      : super(_value, (v) => _then(v as _LoginData));

  @override
  _LoginData get _value => super._value as _LoginData;

  @override
  $Res call({
    Object? loginkey = freezed,
    Object? password = freezed,
  }) {
    return _then(_LoginData(
      loginkey: loginkey == freezed
          ? _value.loginkey
          : loginkey // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginData implements _LoginData {
  const _$_LoginData({required this.loginkey, required this.password});

  factory _$_LoginData.fromJson(Map<String, dynamic> json) =>
      _$$_LoginDataFromJson(json);

  @override
  final String loginkey;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginData(loginkey: $loginkey, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginData &&
            const DeepCollectionEquality().equals(other.loginkey, loginkey) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loginkey),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$LoginDataCopyWith<_LoginData> get copyWith =>
      __$LoginDataCopyWithImpl<_LoginData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginDataToJson(this);
  }
}

abstract class _LoginData implements LoginData {
  const factory _LoginData(
      {required String loginkey, required String password}) = _$_LoginData;

  factory _LoginData.fromJson(Map<String, dynamic> json) =
      _$_LoginData.fromJson;

  @override
  String get loginkey;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$LoginDataCopyWith<_LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) {
  return _RegisterData.fromJson(json);
}

/// @nodoc
class _$RegisterDataTearOff {
  const _$RegisterDataTearOff();

  _RegisterData call(
      {required String name,
      required String email,
      required String phone,
      required String gender,
      required String address,
      required String birthdate,
      required String password,
      required String passwordConfirmation}) {
    return _RegisterData(
      name: name,
      email: email,
      phone: phone,
      gender: gender,
      address: address,
      birthdate: birthdate,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }

  RegisterData fromJson(Map<String, Object?> json) {
    return RegisterData.fromJson(json);
  }
}

/// @nodoc
const $RegisterData = _$RegisterDataTearOff();

/// @nodoc
mixin _$RegisterData {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get birthdate => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get passwordConfirmation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterDataCopyWith<RegisterData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterDataCopyWith<$Res> {
  factory $RegisterDataCopyWith(
          RegisterData value, $Res Function(RegisterData) then) =
      _$RegisterDataCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String email,
      String phone,
      String gender,
      String address,
      String birthdate,
      String password,
      String passwordConfirmation});
}

/// @nodoc
class _$RegisterDataCopyWithImpl<$Res> implements $RegisterDataCopyWith<$Res> {
  _$RegisterDataCopyWithImpl(this._value, this._then);

  final RegisterData _value;
  // ignore: unused_field
  final $Res Function(RegisterData) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? address = freezed,
    Object? birthdate = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: birthdate == freezed
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: passwordConfirmation == freezed
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RegisterDataCopyWith<$Res>
    implements $RegisterDataCopyWith<$Res> {
  factory _$RegisterDataCopyWith(
          _RegisterData value, $Res Function(_RegisterData) then) =
      __$RegisterDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String email,
      String phone,
      String gender,
      String address,
      String birthdate,
      String password,
      String passwordConfirmation});
}

/// @nodoc
class __$RegisterDataCopyWithImpl<$Res> extends _$RegisterDataCopyWithImpl<$Res>
    implements _$RegisterDataCopyWith<$Res> {
  __$RegisterDataCopyWithImpl(
      _RegisterData _value, $Res Function(_RegisterData) _then)
      : super(_value, (v) => _then(v as _RegisterData));

  @override
  _RegisterData get _value => super._value as _RegisterData;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? address = freezed,
    Object? birthdate = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
  }) {
    return _then(_RegisterData(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: birthdate == freezed
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: passwordConfirmation == freezed
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_RegisterData implements _RegisterData {
  const _$_RegisterData(
      {required this.name,
      required this.email,
      required this.phone,
      required this.gender,
      required this.address,
      required this.birthdate,
      required this.password,
      required this.passwordConfirmation});

  factory _$_RegisterData.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterDataFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String gender;
  @override
  final String address;
  @override
  final String birthdate;
  @override
  final String password;
  @override
  final String passwordConfirmation;

  @override
  String toString() {
    return 'RegisterData(name: $name, email: $email, phone: $phone, gender: $gender, address: $address, birthdate: $birthdate, password: $password, passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterData &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.birthdate, birthdate) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.passwordConfirmation, passwordConfirmation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(birthdate),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(passwordConfirmation));

  @JsonKey(ignore: true)
  @override
  _$RegisterDataCopyWith<_RegisterData> get copyWith =>
      __$RegisterDataCopyWithImpl<_RegisterData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterDataToJson(this);
  }
}

abstract class _RegisterData implements RegisterData {
  const factory _RegisterData(
      {required String name,
      required String email,
      required String phone,
      required String gender,
      required String address,
      required String birthdate,
      required String password,
      required String passwordConfirmation}) = _$_RegisterData;

  factory _RegisterData.fromJson(Map<String, dynamic> json) =
      _$_RegisterData.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get gender;
  @override
  String get address;
  @override
  String get birthdate;
  @override
  String get password;
  @override
  String get passwordConfirmation;
  @override
  @JsonKey(ignore: true)
  _$RegisterDataCopyWith<_RegisterData> get copyWith =>
      throw _privateConstructorUsedError;
}

ChangeCurrentPasswordData _$ChangeCurrentPasswordDataFromJson(
    Map<String, dynamic> json) {
  return _ChangeCurrentPasswordData.fromJson(json);
}

/// @nodoc
class _$ChangeCurrentPasswordDataTearOff {
  const _$ChangeCurrentPasswordDataTearOff();

  _ChangeCurrentPasswordData call(
      {required String password,
      required String passwordConfirmation,
      required String currentPassword}) {
    return _ChangeCurrentPasswordData(
      password: password,
      passwordConfirmation: passwordConfirmation,
      currentPassword: currentPassword,
    );
  }

  ChangeCurrentPasswordData fromJson(Map<String, Object?> json) {
    return ChangeCurrentPasswordData.fromJson(json);
  }
}

/// @nodoc
const $ChangeCurrentPasswordData = _$ChangeCurrentPasswordDataTearOff();

/// @nodoc
mixin _$ChangeCurrentPasswordData {
  String get password => throw _privateConstructorUsedError;
  String get passwordConfirmation => throw _privateConstructorUsedError;
  String get currentPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangeCurrentPasswordDataCopyWith<ChangeCurrentPasswordData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeCurrentPasswordDataCopyWith<$Res> {
  factory $ChangeCurrentPasswordDataCopyWith(ChangeCurrentPasswordData value,
          $Res Function(ChangeCurrentPasswordData) then) =
      _$ChangeCurrentPasswordDataCopyWithImpl<$Res>;
  $Res call(
      {String password, String passwordConfirmation, String currentPassword});
}

/// @nodoc
class _$ChangeCurrentPasswordDataCopyWithImpl<$Res>
    implements $ChangeCurrentPasswordDataCopyWith<$Res> {
  _$ChangeCurrentPasswordDataCopyWithImpl(this._value, this._then);

  final ChangeCurrentPasswordData _value;
  // ignore: unused_field
  final $Res Function(ChangeCurrentPasswordData) _then;

  @override
  $Res call({
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? currentPassword = freezed,
  }) {
    return _then(_value.copyWith(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: passwordConfirmation == freezed
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      currentPassword: currentPassword == freezed
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ChangeCurrentPasswordDataCopyWith<$Res>
    implements $ChangeCurrentPasswordDataCopyWith<$Res> {
  factory _$ChangeCurrentPasswordDataCopyWith(_ChangeCurrentPasswordData value,
          $Res Function(_ChangeCurrentPasswordData) then) =
      __$ChangeCurrentPasswordDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String password, String passwordConfirmation, String currentPassword});
}

/// @nodoc
class __$ChangeCurrentPasswordDataCopyWithImpl<$Res>
    extends _$ChangeCurrentPasswordDataCopyWithImpl<$Res>
    implements _$ChangeCurrentPasswordDataCopyWith<$Res> {
  __$ChangeCurrentPasswordDataCopyWithImpl(_ChangeCurrentPasswordData _value,
      $Res Function(_ChangeCurrentPasswordData) _then)
      : super(_value, (v) => _then(v as _ChangeCurrentPasswordData));

  @override
  _ChangeCurrentPasswordData get _value =>
      super._value as _ChangeCurrentPasswordData;

  @override
  $Res call({
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? currentPassword = freezed,
  }) {
    return _then(_ChangeCurrentPasswordData(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: passwordConfirmation == freezed
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      currentPassword: currentPassword == freezed
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ChangeCurrentPasswordData implements _ChangeCurrentPasswordData {
  const _$_ChangeCurrentPasswordData(
      {required this.password,
      required this.passwordConfirmation,
      required this.currentPassword});

  factory _$_ChangeCurrentPasswordData.fromJson(Map<String, dynamic> json) =>
      _$$_ChangeCurrentPasswordDataFromJson(json);

  @override
  final String password;
  @override
  final String passwordConfirmation;
  @override
  final String currentPassword;

  @override
  String toString() {
    return 'ChangeCurrentPasswordData(password: $password, passwordConfirmation: $passwordConfirmation, currentPassword: $currentPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeCurrentPasswordData &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.passwordConfirmation, passwordConfirmation) &&
            const DeepCollectionEquality()
                .equals(other.currentPassword, currentPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(passwordConfirmation),
      const DeepCollectionEquality().hash(currentPassword));

  @JsonKey(ignore: true)
  @override
  _$ChangeCurrentPasswordDataCopyWith<_ChangeCurrentPasswordData>
      get copyWith =>
          __$ChangeCurrentPasswordDataCopyWithImpl<_ChangeCurrentPasswordData>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChangeCurrentPasswordDataToJson(this);
  }
}

abstract class _ChangeCurrentPasswordData implements ChangeCurrentPasswordData {
  const factory _ChangeCurrentPasswordData(
      {required String password,
      required String passwordConfirmation,
      required String currentPassword}) = _$_ChangeCurrentPasswordData;

  factory _ChangeCurrentPasswordData.fromJson(Map<String, dynamic> json) =
      _$_ChangeCurrentPasswordData.fromJson;

  @override
  String get password;
  @override
  String get passwordConfirmation;
  @override
  String get currentPassword;
  @override
  @JsonKey(ignore: true)
  _$ChangeCurrentPasswordDataCopyWith<_ChangeCurrentPasswordData>
      get copyWith => throw _privateConstructorUsedError;
}
