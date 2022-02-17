import 'package:auth/application/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              // AutoRouter.of(context).replace(const NotesOverviewPageRoute());
              // Navigator.of(context).pushNamed('routeName');
              final snackBar = SnackBar(
                  content: const Text('Success'),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(label: 'Action', onPressed: () {}));

              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              context
                  .read<AuthBloc>()
                  .add(const AuthEvent.authCheckRequested());
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
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                autocorrect: false,
                onChanged: (value) => context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.emailChanged(value)),
                validator: (_) => context
                    .read<SignInFormBloc>()
                    .state
                    .emailAddress
                    .value
                    .fold(
                      (f) => f.maybeMap(
                        invalidEmail: (_) => 'Invalid Email',
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
              ),
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
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                obscureText: true,
                autocorrect: false,
                onChanged: (value) => context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.passwordChanged(value)),
                validator: (_) =>
                    context.read<SignInFormBloc>().state.password.value.fold(
                          (f) => f.maybeMap(
                              orElse: () => null,
                              shortPassword: (_) => 'Short Password'),
                          (_) => null,
                        ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .signInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<SignInFormBloc>()
                      .add(const SignInFormEvent.signInWithGooglePressed());
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue, // background
                  onPrimary: Colors.white, // foreground
                ),
                child: const Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
