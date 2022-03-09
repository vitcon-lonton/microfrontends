/* spell-checker: disable */
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class BaseResponse<T> {
  final T? data;
  final String? msg;
  final bool? success;

  bool get valid => (success ?? false);

  BaseResponse({this.msg, this.data, this.success});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}

@freezed
class LoginData with _$LoginData {
  const factory LoginData(
      {required String loginkey, required String password}) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}

@freezed
class RegisterData with _$RegisterData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RegisterData({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String address,
    required String phone,
    required String birthdate,
    required String gender,
  }) = _RegisterData;

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
}

@freezed
class ChangeCurrentPasswordData with _$ChangeCurrentPasswordData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChangeCurrentPasswordData(
      {required String password,
      required String passwordConfirmation,
      required String currentPassword}) = _ChangeCurrentPasswordData;

  factory ChangeCurrentPasswordData.fromJson(Map<String, dynamic> json) =>
      _$ChangeCurrentPasswordDataFromJson(json);
}
