import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_user/presentation/routes/router.gr.dart' as app_router;

import 'injection.dart' show getIt;

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = app_router.Router();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(
          initialRoutes: [
            const app_router.HomePageRoute(),
            // const app_router.FavoritesPageRoute(),
            // const app_router.UserUpdatePageRoute(),
            // const app_router.PasswordChangePageRoute(),
            // const app_router.RegisterPageRoute(),
            // const app_router.PasswordUpdatePageRoute(),
            // const app_router.PasswordForgetPageRoute(),
            // const app_router.OtpConfirmPageRoute(),
            // const app_router.NotificationsPageRoute(),
            // const app_router.HomePageRoute(),
            // const app_router.SignInPageRoute(),
            // const app_router.ServiceBookingPageRoute(),
          ],
        ),
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.green[800],
          appBarTheme: AppBarTheme.of(context).copyWith(centerTitle: false),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue[900],
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
        ),
      ),
    );
  }
}
