// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth/auth.dart';

void main() => runApp(const MyApp());

IAuthFacade facade = AuthFacade();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(facade)),
        BlocProvider(create: (_) => RegisterCubit(facade)),
        BlocProvider(create: (_) => SignInFormBloc(facade)),
        BlocProvider(create: (_) => UpdateUserCubit(facade)),
        BlocProvider(create: (_) => OtpConfirmCubit(facade)),
        BlocProvider(create: (_) => RequestNewOtpCubit(facade)),
        BlocProvider(create: (_) => ForgetPasswordCubit(facade)),
      ],
      child: MaterialApp(
        // title: 'Flutter Demo',
        // home: SplashPage(),
        // home: const SignInPage(),
        // home: const RegisterPage(),
        // home: const UpdateUserPage(),
        // home: const ForgetPasswordPage(),
        home: const OtpConfirmPage(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
