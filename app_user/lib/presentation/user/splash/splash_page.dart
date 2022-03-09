// ignore_for_file: unused_import
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/auth/auth.dart';
import 'package:app_user/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            const Spacer(),
            const Spacer(),
            const Spacer(),
            Text('246',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold)),
            Text(
              'S H O M E',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 12,
                  letterSpacing: 5.0),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpaceXXL),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () =>
                      context.router.replace(const HomePageRoute()),
                  child: const Text('Visit'),
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.white,
                    // primary: Theme.of(context).primaryColor,
                    // backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            kVSpaceM,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpaceXXL),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: TextButton(
                  onPressed: () =>
                      context.router.replace(const SignInPageRoute()),
                  child: const Text('Phone number'),
                  style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
      listener: (context, state) async {
        await Future.delayed(const Duration(seconds: 1));
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
