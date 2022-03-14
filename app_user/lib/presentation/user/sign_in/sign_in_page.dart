part of 'sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr(LocaleKeys.txt_login))),
      body: BlocProvider(
        child: const SignInForm(),
        create: (context) => getIt<SignInBloc>(),
      ),
    );
  }
}
