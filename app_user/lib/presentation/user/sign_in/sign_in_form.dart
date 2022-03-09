part of 'sign_in.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInState();
}

class _SignInState extends State<SignInForm> {
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignInBloc, SignInState>(
          listenWhen: (prev, cur) => prev.phone != cur.phone,
          listener: (context, state) {
            final phoneStr =
                state.phone.value.foldRight('', (value, previous) => value);

            if (_phoneController.text == phoneStr) return;

            _phoneController.text = phoneStr;
          },
        ),
        BlocListener<SignInBloc, SignInState>(
          listenWhen: (prev, cur) => prev.password != cur.password,
          listener: (context, state) {
            final passwordStr =
                state.password.value.foldRight('', (value, previous) => value);

            if (_passwordController.text == passwordStr) return;

            _passwordController.text = passwordStr;
          },
        ),
        BlocListener<SignInBloc, SignInState>(
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
                  context
                      .read<AuthBloc>()
                      .add(const AuthEvent.authCheckRequested());

                  context.router.replace(const HomePageRoute());
                },
              ),
            );
          },
        ),
      ],
      child: Form(
        autovalidateMode: context.read<SignInBloc>().state.showErrorMessages
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const SizedBox(height: 8),
            BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (prev, cur) => prev.phone != cur.phone,
              builder: (context, state) {
                return TextFormField(
                  // controller: _phoneController,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      labelText: 'Phone', prefixIcon: Icon(Icons.phone)),
                  onChanged: (value) => context
                      .read<SignInBloc>()
                      .add(SignInEvent.phoneChanged(value)),
                  initialValue:
                      state.phone.value.foldRight(null, (str, prev) => str),
                  validator: (_) => state.phone.value.fold((failure) {
                    return 'Invalid Phone Number';
                  }, (_) => null),
                );
              },
            ),
            // PhoneInput(
            //   value: state.phone,
            //   onChanged: (value) => context
            //       .read<SignInBloc>()
            //       .add(SignInEvent.phoneChanged(value)),
            // ),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: 'Email',
            //     prefixIcon: Icon(Icons.email),
            //   ),
            //   autocorrect: false,
            //   onChanged: (value) => context
            //       .read<SignInBloc>()
            //       .add(SignInEvent.emailChanged(value)),
            //   validator: (_) => context
            //       .read<SignInBloc>()
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
            // BlocBuilder<SignInBloc, SignInState>(
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
            kVSpaceL,
            BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (prev, cur) =>
                  prev.password != cur.password ||
                  prev.showPassword != cur.showPassword,
              builder: (context, state) {
                return TextFormField(
                  autocorrect: false,
                  // controller: _passwordController,
                  obscureText: !state.showPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(!state.showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        context.read<SignInBloc>().add(
                            SignInEvent.showPasswordChanged(
                                !state.showPassword));
                      },
                    ),
                  ),
                  initialValue: state.password.getOrCrash(),
                  onChanged: (value) => context
                      .read<SignInBloc>()
                      .add(SignInEvent.passwordChanged(value)),
                  validator: (_) => state.password.value.fold((failure) {
                    return 'Short Password';
                  }, (_) => null),
                );
              },
            ),
            const SizedBox(height: 8),
            BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
              builder: (context, state) => WSubmitBtn(
                child: Text(state.isSubmitting ? '...' : 'LOGIN'),
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
