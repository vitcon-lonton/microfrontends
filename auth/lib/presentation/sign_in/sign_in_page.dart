import 'package:auth/application/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sign_in_form.dart';
// import 'package:notes_firebase_ddd_course/application/auth/sign_in_form/sign_in_form_bloc.dart';
// import 'package:notes_firebase_ddd_course/injection.dart';
// import 'package:notes_firebase_ddd_course/presentation/sign_in/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  final SignInFormBloc bloc;

  const SignInPage({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: BlocProvider(
        child: const SignInForm(),
        create: (context) => bloc,
        // create: (context) => getIt<SignInFormBloc>(),
      ),
    );
  }
}
