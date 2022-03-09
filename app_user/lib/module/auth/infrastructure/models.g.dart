// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      msg: json['msg'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      success: json['success'] as bool?,
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

_$_LoginData _$$_LoginDataFromJson(Map<String, dynamic> json) => _$_LoginData(
      loginkey: json['loginkey'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_LoginDataToJson(_$_LoginData instance) =>
    <String, dynamic>{
      'loginkey': instance.loginkey,
      'password': instance.password,
    };

_$_RegisterData _$$_RegisterDataFromJson(Map<String, dynamic> json) =>
    _$_RegisterData(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
      birthdate: json['birthdate'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$$_RegisterDataToJson(_$_RegisterData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'address': instance.address,
      'birthdate': instance.birthdate,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };

_$_ChangeCurrentPasswordData _$$_ChangeCurrentPasswordDataFromJson(
        Map<String, dynamic> json) =>
    _$_ChangeCurrentPasswordData(
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      currentPassword: json['current_password'] as String,
    );

Map<String, dynamic> _$$_ChangeCurrentPasswordDataToJson(
        _$_ChangeCurrentPasswordData instance) =>
    <String, dynamic>{
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'current_password': instance.currentPassword,
    };
