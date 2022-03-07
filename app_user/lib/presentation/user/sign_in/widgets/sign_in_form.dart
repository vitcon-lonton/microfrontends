import 'package:app_user/presentation/routes/router.gr.dart';
import 'package:auth/application/application.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listenWhen: (prev, cur) {
        return prev.authFailureOrSuccessOption !=
            cur.authFailureOrSuccessOption;
      },
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(
                  failure.map(
                    cancelledByUser: (_) => 'Cancelled',
                    serverError: (_) => 'Server error',
                    emailAlreadyInUse: (_) => 'Email already in use',
                    invalidEmailAndPasswordCombination: (_) =>
                        'Invalid email and password combination',
                  ),
                ),
                action: SnackBarAction(label: 'Action', onPressed: () {}),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            (_) {
              final snackBar = SnackBar(
                  content: const Text('Success'),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(label: 'Action', onPressed: () {}));

              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              context
                  .read<AuthBloc>()
                  .add(const AuthEvent.authCheckRequested());

              context.router.replace(const HomePageRoute());
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const Text(
                '📝',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 130),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  prefixIcon: Icon(Icons.lock),
                ),
                autocorrect: false,
                onChanged: (value) => context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.phoneChanged(value)),
                validator: (_) => context
                    .read<SignInFormBloc>()
                    .state
                    .phone
                    .value
                    .fold((failure) {
                  return 'Invalid Phone Number';
                }, (_) => null),
              ),
              // PhoneInput(
              //   value: state.phone,
              //   onChanged: (value) => context
              //       .read<SignInFormBloc>()
              //       .add(SignInFormEvent.phoneChanged(value)),
              // ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     labelText: 'Email',
              //     prefixIcon: Icon(Icons.email),
              //   ),
              //   autocorrect: false,
              //   onChanged: (value) => context
              //       .read<SignInFormBloc>()
              //       .add(SignInFormEvent.emailChanged(value)),
              //   validator: (_) => context
              //       .read<SignInFormBloc>()
              //       .state
              //       .emailAddress
              //       .value
              //       .fold(
              //         (f) => f.maybeMap(
              //           invalidEmail: (_) => 'Invalid Email',
              //           orElse: () => null,
              //         ),
              //         (_) => null,
              //       ),
              // ),
              // BlocBuilder<SignInFormBloc, SignInFormState>(
              //   buildWhen: (previous, current) =>
              //       previous.emailAddress != current.emailAddress,
              //   builder: (context, state) {
              //     final emailAddressError = state.emailAddress.value.fold(
              //       (f) => f.maybeMap(
              //         orElse: () => null,
              //         invalidEmail: (_) => 'Invalid Email',
              //         // orElse: () => 'Invalid Email',
              //       ),
              //       (_) => null,
              //     );

              //     if (emailAddressError != null) return Text(emailAddressError);

              //     return const SizedBox.shrink();
              //   },
              // ),
              const SizedBox(height: 8),
              TextFormField(
                autocorrect: false,
                obscureText: !state.showPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(!state.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      context.read<SignInFormBloc>().add(
                          SignInFormEvent.showPasswordChanged(
                              !state.showPassword));
                    },
                  ),
                ),
                onChanged: (value) => context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.passwordChanged(value)),
                validator: (_) => context
                    .read<SignInFormBloc>()
                    .state
                    .password
                    .value
                    .fold((failure) {
                  return 'Short Password';
                }, (_) => null),
              ),
              const SizedBox(height: 8),
              BlocBuilder<SignInFormBloc, SignInFormState>(
                buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
                builder: (context, state) => WSubmitBtn(
                  child: Text(state.isSubmitting ? '...' : 'SIGN UP'),
                  onPressed: !state.isSubmitting
                      ? () => context.read<SignInFormBloc>().add(
                            const SignInFormEvent
                                .signInWithPhoneAndPasswordPressed(),
                          )
                      : null,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(const SignInFormEvent
                            .signInWithPhoneAndPasswordPressed());
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(const SignInFormEvent
                            .registerWithPhoneAndPasswordPressed());
                      },
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              if (state.isSubmitting) ...[
                const SizedBox(height: 8),
                const LinearProgressIndicator(),
              ]
            ],
          ),
        );
      },
    );
  }
}
