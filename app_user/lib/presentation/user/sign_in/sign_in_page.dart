part of 'sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtForgotPassword = tr(LocaleKeys.txt_forgot_password);
    final txtRegister = tr(LocaleKeys.txt_register);

    return BlocProvider.value(
      value: getIt<SignInBloc>(),
      child: Scaffold(
        body: ListView(children: [
          const SignInForm(),
          kVSpaceM,
          Row(children: [
            Link(
                text: txtForgotPassword,
                onTap: () {
                  context.router.push(const PasswordForgetPageRoute());
                }),
          ]),
          kVSpaceM,
          Row(children: [
            Link(
              onTap: () {
                context.router.push(const RegisterPageRoute());
              },
              text: txtRegister,
            )
          ])
          // Link(text: 'text', onTap: () {}),
        ], padding: const EdgeInsets.all(8)),
        appBar: AppBar(title: Text(tr(LocaleKeys.txt_login))),
      ),
    );
  }
}
