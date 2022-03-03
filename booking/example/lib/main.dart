import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:booking/booking.dart';

void main() => runApp(const MyApp());

final repository = BookingRepository();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit(repository)),
        BlocProvider(create: (_) => OrderDetailCubit(repository)),
        BlocProvider(create: (_) => OrderHistoriesCubit(repository)),
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
          home: const CartPage(),
          // home: const OrderDetailPage(),
          // home: const OrderHistoriesPage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
        ),
      ),
    );
  }
}
