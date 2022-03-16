part of 'register.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtRegister = tr(LocaleKeys.txt_register);

    final AutovalidateMode autovalidateMode;
    if (context.read<RegisterCubit>().state.showErrorMessages) {
      autovalidateMode = AutovalidateMode.always;
    } else {
      autovalidateMode = AutovalidateMode.disabled;
    }

    return Form(
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) => prev.fullName != cur.fullName,
            builder: (context, state) => FullNameInput(
              initialValue: '9999999999',
              name: state.fullName,
              onChanged: context.read<RegisterCubit>().fullNameChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) => prev.phone != cur.phone,
            builder: (context, state) {
              return PhoneInput(
                initialValue: '9999999999',
                phone: state.phone,
                onChanged: context.read<RegisterCubit>().phoneChanged,
              );
            },
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) => prev.emailAddress != cur.emailAddress,
            builder: (context, state) => EmailAddressInput(
              initialValue: '9999999999@gmail.com',
              emailAddress: state.emailAddress,
              onChanged: context.read<RegisterCubit>().emailAddressChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) =>
                prev.password != cur.password ||
                prev.displayPassword != cur.displayPassword,
            builder: (context, state) => PasswordInput(
              initialValue: '123123123',
              password: state.password,
              showPassword: state.displayPassword,
              onPressShowPassword: () => context
                  .read<RegisterCubit>()
                  .displayPasswordChanged(!state.displayPassword),
              onChanged: context.read<RegisterCubit>().passwordChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) =>
                prev.confirmPassword != cur.confirmPassword ||
                prev.displayConfirmPassword != cur.displayConfirmPassword,
            builder: (context, state) => PasswordInput(
              initialValue: '123123123',
              password: state.confirmPassword,
              showPassword: state.displayConfirmPassword,
              onPressShowPassword: () => context
                  .read<RegisterCubit>()
                  .displayConfirmPasswordChanged(!state.displayConfirmPassword),
              onChanged: context.read<RegisterCubit>().confirmPasswordChanged,
            ),
          ),
          kVSpaceXXS,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) =>
                prev.password != cur.password ||
                prev.confirmPassword != cur.confirmPassword ||
                prev.isPasswordMatch != cur.isPasswordMatch,
            builder: (context, state) {
              if (!state.password.isValid() ||
                  !state.confirmPassword.isValid() ||
                  state.isPasswordMatch) {
                return kSpaceZero;
              }

              return Row(
                children: [
                  Text('Password and confirm password not match',
                      style: const TextStyle(fontSize: 12.5)
                          .copyWith(color: Theme.of(context).errorColor))
                ],
              );
            },
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) =>
                prev.isValid != cur.isValid ||
                prev.isSubmitting != cur.isSubmitting,
            builder: (context, state) {
              return FormSubmitBtn(
                  child: Text(txtRegister),
                  isSubmitting: state.isSubmitting,
                  onPressed: !state.isValid
                      ? null
                      : context.read<RegisterCubit>().registered);
            },
          ),
        ],
      ),
    );
  }
}

// kVSpaceM,
// BlocBuilder<RegisterCubit, RegisterState>(
//   buildWhen: (prev, cur) => prev.street != cur.street,
//   builder: (context, state) => StreetInput(
//     value: state.street,
//     onChanged: context.read<RegisterCubit>().streetChanged,
//   ),
// ),

// TextFormField(
//   decoration: const InputDecoration(
//     labelText: 'Password',
//     prefixIcon: Icon(Icons.lock),
//   ),
//   obscureText: true,
//   autocorrect: false,
//   onChanged: context.read<RegisterCubit>().passwordChanged,
//   validator: (_) => context
//       .read<SignInBloc>()
//       .state
//       .password
//       .value
//       .fold(
//           (f) => f.maybeMap(
//               orElse: () => null,
//               shortPassword: (_) => 'Short Password'),
//           (_) => null),
// ),
// BlocBuilder<RegisterCubit, RegisterState>(
//   buildWhen: (prev, cur) => prev.emailAddress != cur.emailAddress,
//   builder: (context, state) => EmailAddressInput(
//     value: state.emailAddress,
//     onChanged: context.read<RegisterCubit>().emailAddressChanged,
//   ),
// ),
// BlocBuilder<RegisterCubit, RegisterState>(
//   buildWhen: (prev, cur) => prev.emailAddress != cur.emailAddress,
//   builder: (context, state) => TextFormField(
//       autocorrect: false,
//       decoration: const InputDecoration(
//           labelText: 'Phone',
//           prefixIcon: Icon(Icons.email),
//           hintText: 'no-reply@3co.network'),
//       onChanged: context.read<RegisterCubit>().phoneChanged,
//       validator: (_) => context
//           .read<RegisterCubit>()
//           .state
//           .emailAddress
//           .value
//           .fold(
//               (f) => f.maybeMap(
//                   orElse: () => null,
//                   invalidEmail: (_) => 'Invalid Email'),
//               (_) => null)),
// ),

// BlocBuilder<RegisterCubit, RegisterState>(
//     buildWhen: (prev, cur) => prev.birthDay != cur.birthDay,
//     builder: (context, state) => WTextInput(
//       hintText: 'Birthday',
//       errorText: context
//           .read<RegisterCubit>()
//           .state
//           .birthDay
//           .value
//           .fold((failure) => 'Invalid Birthday', (_) => null),
//       // onChanged: context.read<RegisterCubit>().streetChanged,
//     ),
//   ),