// ignore_for_file: unused_import

import 'dart:ui';

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
        BlocProvider(create: (_) => UserUpdateCubit(facade)),
        BlocProvider(create: (_) => OtpConfirmCubit(facade)),
        BlocProvider(create: (_) => OtpRequestNewCubit(facade)),
        BlocProvider(create: (_) => NotificationsCubit(facade)),
        BlocProvider(create: (_) => PasswordForgetCubit(facade)),
        BlocProvider(create: (_) => PasswordChangeCubit(facade)),
        BlocProvider(create: (_) => PasswordUpdateCubit(facade)),
        BlocProvider(create: (_) => OrderHistoriesCubit(facade)),
      ],
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
          PointerDeviceKind.invertedStylus
        }),
        child: MaterialApp(
          // title: 'Flutter Demo',
          // home: SplashPage(),
          // home: const SignInPage(),
          // home: const RegisterPage(),
          // home: const UserUpdatePage(),
          // home: const PasswordForgetPage(),
          // home: const OtpConfirmPage(),
          // home: const SettingsPage(),
          // home: const PasswordChangePage(),
          // home: const PasswordUpdatePage(),
          // home: const OrderHistoriesPage(),
          home: const NotificationsPage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
        ),
      ),
    );
  }
}
