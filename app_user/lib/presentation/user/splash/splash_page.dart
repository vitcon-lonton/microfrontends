import 'package:app_user/presentation/routes/router.gr.dart';
import 'package:auth/application/application.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      child: const Scaffold(body: Center(child: CircularProgressIndicator())),
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) => context.router.replace(const HomePageRoute()),
          unauthenticated: (_) =>
              context.router.replace(const SignInPageRoute()),
          // unauthenticated: (_) {
          //   return context.router.replace(const HomePageRoute());
          // },
        );
      },
    );
  }
}
