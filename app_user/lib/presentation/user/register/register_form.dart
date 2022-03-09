part of 'register.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: context.read<RegisterCubit>().state.showErrorMessages
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) => prev.name != cur.name,
            builder: (context, state) => NameInput(
              value: state.name,
              onChanged: context.read<RegisterCubit>().nameChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) => prev.phone != cur.phone,
            builder: (context, state) {
              return PhoneInput(
                value: state.phone,
                onChanged: context.read<RegisterCubit>().phoneChanged,
              );
            },
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) =>
                prev.password != cur.password ||
                prev.displayPassword != cur.displayPassword,
            builder: (context, state) => PasswordInput(
              value: state.password,
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
              value: state.confirmPassword,
              showPassword: state.displayConfirmPassword,
              onPressShowPassword: () => context
                  .read<RegisterCubit>()
                  .displayConfirmPasswordChanged(!state.displayConfirmPassword),
              onChanged: context.read<RegisterCubit>().passwordChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
            builder: (context, state) => FormSubmitBtn(
              child: const Text('REGISTER'),
              isSubmitting: state.isSubmitting,
              onPressed: context.read<RegisterCubit>().submitted,
            ),
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