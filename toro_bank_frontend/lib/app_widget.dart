import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_modular/flutter_modular.dart';
import 'package:toro_bank_frontend/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Toro Bank',
      theme: theme(),
      initialRoute: Modular.initialRoute,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
