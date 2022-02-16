// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:service/application/forget_password/forget_password_cubit.dart';
import 'package:service/application/register/register_cubit.dart';
import 'package:service/presentation/forget_password/forget_password.dart';
import 'package:service/presentation/register/register.dart';
import 'package:service/service.dart';

void main() => runApp(const MyApp());

IAuthFacade facade = FirebaseAuthFacade();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(facade),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        // home: SplashPage(),
        // home: SignInPage(bloc: SignInFormBloc(facade)),
        // home: RegisterPage(cubit: RegisterCubit(facade)),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: ForgetPasswordPage(cubit: ForgetPasswordCubit(facade)),
      ),
    );
  }
}
