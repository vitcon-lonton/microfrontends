// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth/auth.dart';
import 'package:auth/presentation/forget_password/forget_password.dart';
import 'package:auth/presentation/register/register.dart';

void main() => runApp(const MyApp());

IAuthFacade facade = FirebaseAuthFacade();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterCubit(facade)),
        BlocProvider(create: (_) => SignInFormBloc(facade)),
        BlocProvider(create: (_) => UpdateUserCubit(facade)),
        BlocProvider(create: (_) => ForgetPasswordCubit(facade)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        // home: const RegisterPage(),
        home: const UpdateUserPage(),
        theme: ThemeData(primarySwatch: Colors.blue),
        // home: SplashPage(),
        // home: SignInPage(bloc: SignInFormBloc(facade)),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // home: const ForgetPasswordPage(),
      ),
    );
  }
}
