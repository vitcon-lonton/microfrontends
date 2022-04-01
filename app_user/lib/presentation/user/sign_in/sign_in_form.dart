part of 'sign_in.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInState();
}

class _SignInState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    final txtLogin = tr(LocaleKeys.txt_login);

    return MultiBlocListener(
      listeners: [
        BlocListener<SignInBloc, SignInState>(listenWhen: (prev, cur) {
          return prev.authFailureOrSuccessOption !=
              cur.authFailureOrSuccessOption;
        }, listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failure) {
              final message = failure.maybeWhen(
                  orElse: () => 'Unable login',
                  unableSignIn: (errors) => errors.join('\n'));

              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
            }, (_) {
              context
                  .read<AuthBloc>()
                  .add(const AuthEvent.authCheckRequested());
              context.read<UserCubit>().getUserRequested();
              context.router.replace(const HomePageRoute());
            }),
          );
        }),
      ],
      child: Form(
        autovalidateMode: context.read<SignInBloc>().state.showErrorMessages
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: Column(
          children: [
            const SizedBox(height: 8),
            BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (prev, cur) => prev.phone != cur.phone,
              builder: (context, state) => PhoneInput(
                phone: state.phone,
                initialValue: '0909090909',
                onChanged: (value) => context
                    .read<SignInBloc>()
                    .add(SignInEvent.phoneChanged(value)),
              ),
            ),
            kVSpaceL,
            BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (prev, cur) =>
                  prev.password != cur.password ||
                  prev.showPassword != cur.showPassword,
              builder: (context, state) => PasswordInput(
                initialValue: '123123',
                password: state.password,
                showPassword: state.showPassword,
                onChanged: (value) => context
                    .read<SignInBloc>()
                    .add(SignInEvent.passwordChanged(value)),
                onPressShowPassword: () {
                  context.read<SignInBloc>().add(
                      SignInEvent.showPasswordChanged(!state.showPassword));
                },
              ),
            ),
            const SizedBox(height: 8),
            BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
              builder: (context, state) => WSubmitBtn(
                child: Text(state.isSubmitting ? '...' : txtLogin),
                onPressed: !state.isSubmitting
                    ? () => context.read<SignInBloc>().add(
                          const SignInEvent.signInWithPhoneAndPasswordPressed(),
                        )
                    : null,
              ),
            ),
            BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
              builder: (context, state) {
                return Column(
                  children: [
                    if (state.isSubmitting) ...[
                      const SizedBox(height: 8),
                      const LinearProgressIndicator(),
                    ]
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
