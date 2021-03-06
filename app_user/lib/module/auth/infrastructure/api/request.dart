/* spell-checker: disable */
part of 'account_api.dart';

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
  const factory RegisterData(
      {String? email,
      String? gender,
      String? address,
      String? birthdate,
      required String name,
      required String phone,
      required String password,
      required String passwordConfirmation}) = _RegisterData;

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
