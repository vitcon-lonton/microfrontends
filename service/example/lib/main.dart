// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service/service.dart';

void main() => runApp(const MyApp());

// IServiceRepository facade = FirebaseAuthFacade();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(),
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
    // return BlocProvider(
    //   create: (context) => AuthBloc(facade),
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(primarySwatch: Colors.blue),
    //     // home: SplashPage(),
    //     // home: SignInPage(bloc: SignInFormBloc(facade)),
    //     // home: RegisterPage(cubit: RegisterCubit(facade)),
    //     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //     home: ForgetPasswordPage(cubit: ForgetPasswordCubit(facade)),
    //   ),
    // );
  }
}
