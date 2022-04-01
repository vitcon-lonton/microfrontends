import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_user/presentation/routes/routes.dart' as app_router;
import 'injection.dart' show getIt;
import 'module/auth/auth.dart';
import 'module/favorite/favorite.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    final _appRouter = app_router.Router();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<FavoriteDeleteCubit>()),
        BlocProvider.value(value: getIt<FavoriteCreateCubit>()),
        BlocProvider.value(value: getIt<UserCubit>()..getUserRequested()),
        BlocProvider.value(
          value: getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
      ],
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
          PointerDeviceKind.invertedStylus
        }),
        child: MultiBlocListener(
          listeners: [
            // LISTEN DELETE
            BlocListener<FavoriteDeleteCubit, FavoriteDeleteState>(
                listener: (context, state) => state.whenOrNull(
                    deleteSuccess: () => _messengerKey.currentState
                        ?.showSnackBar(
                            const SnackBar(content: Text('DELETE SUCCESS.'))),
                    deleteFailure: (failure) => _messengerKey.currentState
                        ?.showSnackBar(const SnackBar(
                            content: Text(
                                'Unexpected error occurred while deleting.'))))),

            // LISTEN CREATE
            BlocListener<FavoriteCreateCubit, FavoriteCreateState>(
              listener: (context, state) => state.whenOrNull(
                  // createSuccess: (state) {
                  //   // return context.read<FavoriteAllCubit>().getAllRequested();
                  // },
                  createSuccess: () => _messengerKey.currentState?.showSnackBar(
                      const SnackBar(content: Text('CREATE SUCCESS.'))),
                  createFailure: (failure) => _messengerKey.currentState
                      ?.showSnackBar(
                          const SnackBar(content: Text('Unexpected error.')))),
            ),
          ],
          child: MaterialApp.router(
            title: 'Flutter Demo',
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: _messengerKey,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(initialRoutes: [
              // const app_router.SplashPageRoute(),
              // app_router.ImageSelectorRoute(),
              // const app_router.HomePageRoute(),

              // const app_router.SignInPageRoute(),
              // const app_router.RegisterPageRoute(),
              // const app_router.OtpConfirmPageRoute(),
              // const app_router.UserUpdatePageRoute(),
              // const app_router.PasswordUpdatePageRoute(),
              // const app_router.PasswordForgetPageRoute(),
              // const app_router.PasswordChangePageRoute(),
              // const app_router.SettingsPageRoute(),

              /// FAVORITES
              // const app_router.FavoritesPageRoute(),

              /// SERVICE
              // const app_router.CategoriesPageRoute(),
              // app_router.ServiceBookingPageRoute(serviceId: 15),
              // const app_router.ServicesPageRoute(),

              /// BOOKING
              // app_router.CartItemFormPageRoute(),
              // const app_router.CartPageRoute(),
              // app_router.BookingDetailPageRoute(id: 322),
              const app_router.BookingHistoriesPageRoute(),

              /// NOTIFICATION
              // const app_router.NotificationsPageRoute(),

              /// RATING
              // const app_router.RatingPageRoute(),
            ]),
            theme: ThemeData.light().copyWith(
              primaryColor: const Color(0xFFD44541),
              appBarTheme: AppBarTheme.of(context)
                  .copyWith(centerTitle: false, elevation: 0),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  elevation: 0,
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFFD44541)),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              colorScheme: const ColorScheme.light(primary: Color(0xFFD44541)),
              // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
              // primaryColor: Colors.green[800],
              // colorScheme:
              //     ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
              // floatingActionButtonTheme: FloatingActionButtonThemeData(
              //   backgroundColor: Colors.blue[900],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
