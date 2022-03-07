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
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(
          initialRoutes: [
            // const app_router.ServiceBookingPageRoute(),
            const app_router.HomePageRoute(),
            // const app_router.HomePageRoute(),
            // const app_router.SignInPageRoute(),
          ],
        ),
        debugShowCheckedModeBanner: false,
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

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         // Articles
//         BlocProvider(create: (context) => getIt<ArticlesCubit>()),
//         // Booking
//         BlocProvider(create: (context) => getIt<OrderRatingCubit>()),
//         BlocProvider(create: (context) => getIt<OrderHistoriesCubit>()),
//       ],
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(primarySwatch: Colors.blue),
//         home: const OrderHistoriesPage(),
//         // home: BlocProvider.value(
//         //   value: getIt<ArticlesCubit>(),
//         //   child: const Articles(),
//         // ),
//         // home: SignInPage(bloc: getIt<SignInFormBloc>()),
//       ),
//     );
//   }
// }
