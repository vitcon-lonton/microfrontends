import 'package:app_user/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/module/auth/auth.dart';

class PhoneInput extends StatelessWidget {
  final Phone value;
  final void Function(String)? onChanged;

  const PhoneInput({
    Key? key,
    this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtPhoneNumber = tr(LocaleKeys.txt_phone_number);

    return WTextInput(
      label: txtPhoneNumber,
      hintText: txtPhoneNumber,
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      initialValue: value.value.fold((failure) {
        return failure.failedValue;
      }, (string) => string),
      errorText: value.value.fold((failure) {
        return 'Invalid $txtPhoneNumber';
      }, (_) => null),
    );
    // return Container();
  }
}

class EmailAddressInput extends StatelessWidget {
  final EmailAddress value;
  final void Function(String)? onChanged;

  const EmailAddressInput({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WTextInput(
      label: 'Email',
      hintText: 'Email',
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      initialValue: value.value.fold((failure) {
        return failure.failedValue;
      }, (string) => string),
      errorText: value.value.fold((failure) {
        return 'Invalid Email';
      }, (_) => null),
    );
    // validator: (_) => context
    //     .read<RegisterCubit>()
    //     .state
    //     .emailAddress
    //     .value
    //     .fold(
    //         (f) => f.maybeMap(
    //             orElse: () => null,
    //             invalidEmail: (_) => 'Invalid Email'),
    //         (_) => null),
    // errorText: context
    //     .read<RegisterCubit>()
    //     .state
    //     .emailAddress
    //     .value
    //     .fold(
    //         (f) => f.maybeMap(
    //             orElse: () => null,
    //             invalidEmail: (_) => 'Invalid Email'),
    //         (_) => null),
  }
}

class PasswordInput extends StatelessWidget {
  final Password value;
  final bool showPassword;
  final void Function(String)? onChanged;
  final void Function()? onPressShowPassword;

  const PasswordInput({
    Key? key,
    required this.value,
    this.onChanged,
    this.showPassword = false,
    this.onPressShowPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtPassword = tr(LocaleKeys.txt_password);

    return WTextInput(
      label: txtPassword,
      hintText: txtPassword,
      suffixIcon: IconButton(
        onPressed: onPressShowPassword,
        icon: Icon(!showPassword ? Icons.visibility : Icons.visibility_off),
      ),
      onChanged: onChanged,
      obscureText: !showPassword,
      initialValue: value.value.fold((failure) {
        return failure.failedValue;
      }, (string) => string),
      errorText: value.value.fold((failure) {
        return 'Short $txtPassword';
      }, (_) => null),
    );
  }
}

class StreetInput extends StatelessWidget {
  final Street value;
  final void Function(String)? onChanged;

  const StreetInput({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WTextInput(
      label: 'Address',
      hintText: 'Address',
      onChanged: onChanged,
      initialValue: value.value.fold((failure) {
        return failure.failedValue;
      }, (string) => string),
      errorText: value.value.fold((failure) => 'Invalid address', (_) => null),
    );
  }
}

class NameInput extends StatelessWidget {
  final Name value;
  final void Function(String)? onChanged;

  const NameInput({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtFullName = tr(LocaleKeys.txt_full_name);

    return WTextInput(
      label: txtFullName,
      hintText: txtFullName,
      onChanged: onChanged,
      initialValue: value.value.fold((failure) {
        return failure.failedValue;
      }, (string) => string),
      errorText: value.value.fold((failure) {
        return 'Invalid $txtFullName';
      }, (_) => null),
    );
  }
}

class FormSubmitBtn extends StatelessWidget {
  final Widget child;
  final bool isSubmitting;
  final VoidCallback? onPressed;

  const FormSubmitBtn({
    Key? key,
    required this.child,
    this.onPressed,
    this.isSubmitting = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WSubmitBtn(
      onPressed: isSubmitting ? null : onPressed,
      child: isSubmitting ? const Text('...') : child,
    );
  }
}
