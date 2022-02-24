part of 'update_user.dart';

class UpdateUserForm extends StatelessWidget {
  const UpdateUserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: context.read<RegisterCubit>().state.showErrorMessages
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) => prev.emailAddress != cur.emailAddress,
            builder: (context, state) => WTextInput(
              hintText: 'Email',
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
              errorText: context
                  .read<RegisterCubit>()
                  .state
                  .emailAddress
                  .value
                  .fold(
                      (f) => f.maybeMap(
                          orElse: () => null,
                          invalidEmail: (_) => 'Invalid Email'),
                      (_) => null),
              onChanged: context.read<RegisterCubit>().emailAddressChanged,
            ),
          ),
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
          kVSpaceM,
          // TextFormField(
          //   decoration: const InputDecoration(
          //     labelText: 'Password',
          //     prefixIcon: Icon(Icons.lock),
          //   ),
          //   obscureText: true,
          //   autocorrect: false,
          //   onChanged: context.read<RegisterCubit>().passwordChanged,
          //   validator: (_) => context
          //       .read<SignInFormBloc>()
          //       .state
          //       .password
          //       .value
          //       .fold(
          //           (f) => f.maybeMap(
          //               orElse: () => null,
          //               shortPassword: (_) => 'Short Password'),
          //           (_) => null),
          // ),
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) =>
                prev.password != cur.password ||
                prev.displayPassword != cur.displayPassword,
            builder: (context, state) => WTextInput(
              hintText: 'Password',
              errorText: context
                  .read<RegisterCubit>()
                  .state
                  .password
                  .value
                  .fold(
                      (f) => f.maybeMap(
                          orElse: () => null,
                          shortPassword: (_) => 'Short Password'),
                      (_) => null),
              obscureText: !state.displayPassword,
              onChanged: context.read<RegisterCubit>().passwordChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) =>
                prev.confirmPassword != cur.confirmPassword ||
                prev.displayPassword != cur.displayPassword,
            builder: (context, state) => WTextInput(
              hintText: 'Confirm password',
              errorText: context
                  .read<RegisterCubit>()
                  .state
                  .password
                  .value
                  .fold(
                      (f) => f.maybeMap(
                          orElse: () => null,
                          shortPassword: (_) => 'Short Password'),
                      (_) => null),
              obscureText: !state.displayPassword,
              onChanged: context.read<RegisterCubit>().passwordChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) => prev.phone != cur.phone,
            builder: (context, state) => WTextInput(
              hintText: 'Phone number',
              onChanged: context.read<RegisterCubit>().phoneChanged,
              errorText: context
                  .read<RegisterCubit>()
                  .state
                  .phone
                  .value
                  .fold((failure) => 'Invalid phone number', (_) => null),
            ),
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) => prev.birthDay != cur.birthDay,
            builder: (context, state) => WTextInput(
              hintText: 'Birthday',
              errorText: context
                  .read<RegisterCubit>()
                  .state
                  .birthDay
                  .value
                  .fold((failure) => 'Invalid Birthday', (_) => null),
              // onChanged: context.read<RegisterCubit>().streetChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) => prev.street != cur.street,
            builder: (context, state) => WTextInput(
              hintText: 'Address',
              errorText: context
                  .read<RegisterCubit>()
                  .state
                  .street
                  .value
                  .fold((failure) => 'Invalid address', (_) => null),
              onChanged: context.read<RegisterCubit>().streetChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (prev, cur) => prev.status != cur.status,
            builder: (context, state) => WSubmitBtn(
              child: state.status.maybeMap(
                busy: (_) => const Text('....'),
                orElse: () => const Text('SIGN UP'),
              ),
              onPressed: state.status.maybeMap(
                busy: (_) => null,
                orElse: () => context.read<RegisterCubit>().submitted,
              ),
              // onPressed: context.read<RegisterCubit>().emailSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
