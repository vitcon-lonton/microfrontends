import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth/application/register/register_cubit.dart';
import 'package:auth/auth.dart';
import 'package:auth/presentation/register/register.dart';

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
        // home: SignInPage(bloc: SignInFormBloc(facade)),
        home: RegisterPage(cubit: RegisterCubit(facade)),
        // home: SplashPage(),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
