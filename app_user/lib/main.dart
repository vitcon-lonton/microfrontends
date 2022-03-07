import 'package:app_user/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  // await Firebase.initializeApp();
  runApp(const AppWidget());
}
