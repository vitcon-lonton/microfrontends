import 'package:app_user/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth/application/sign_in_form/sign_in_form_bloc.dart';

import 'widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: BlocProvider(
        child: const SignInForm(),
        // create: (context) => getIt<SignInFormBloc>(),
        create: (context) => getIt<SignInFormBloc>()
          ..add(const SignInFormEvent.passwordChanged('0909090909'))
          ..add(const SignInFormEvent.phoneChanged('123123')),
      ),
    );
  }
}
