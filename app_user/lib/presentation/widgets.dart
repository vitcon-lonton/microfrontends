import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/i18n/i18n.dart';
import 'package:app_user/module/auth/auth.dart';

class PhoneInput extends StatelessWidget {
  final Phone? phone;
  final String? initialValue;
  final void Function(String)? onChanged;

  const PhoneInput({
    Key? key,
    this.phone,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtPhoneNumber = tr(LocaleKeys.txt_phone_number);

    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(labelText: txtPhoneNumber),
      validator: (str) {
        if (str == null) return null;
        return phone?.value
            .fold((failure) => '$txtPhoneNumber Invalid', (_) => null);
      },
    );
  }
}

class EmailAddressInput extends StatelessWidget {
  final String? initialValue;
  final EmailAddress? emailAddress;
  final void Function(String)? onChanged;

  const EmailAddressInput({
    Key? key,
    this.initialValue,
    this.emailAddress,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtEmail = tr(LocaleKeys.txt_email);

    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(labelText: txtEmail),
      validator: (str) {
        if (str == null) return null;
        return emailAddress?.value
            .fold((failure) => '$txtEmail Invalid', (_) => null);
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  final bool showPassword;
  final Password? password;
  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function()? onPressShowPassword;

  const PasswordInput(
      {Key? key,
      this.showPassword = false,
      this.password,
      this.initialValue,
      this.onChanged,
      this.onPressShowPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtPassword = tr(LocaleKeys.txt_password);

    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      obscureText: !showPassword,
      decoration: InputDecoration(
        labelText: txtPassword,
        suffixIcon: IconButton(
          onPressed: onPressShowPassword,
          icon: Icon(!showPassword ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      validator: (str) {
        return (str == null)
            ? null
            : Password(str)
                .value
                .fold((failure) => '$txtPassword Short', (_) => null);
      },
    );
  }
}

class FullNameInput extends StatelessWidget {
  final FullName? name;
  final String? initialValue;
  final void Function(String)? onChanged;

  const FullNameInput({
    Key? key,
    this.name,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtFullName = tr(LocaleKeys.txt_full_name);

    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(labelText: txtFullName),
      validator: (str) {
        return (str == null)
            ? null
            : Name(str)
                .value
                .fold((failure) => '$txtFullName Invalid', (_) => null);
      },
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



// return WTextInput(
//   label: 'Email',
//   hintText: 'Email',
//   onChanged: onChanged,
//   initialValue: initialValue,
//   keyboardType: TextInputType.phone,
//   errorText: value.value.fold((failure) {
//     return 'Invalid Email';
//   }, (_) => null),
// );
// validator: (str) =
//
//if (str == null) 
// return null;  
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