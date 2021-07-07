import 'package:flutter/material.dart';
import 'package:journal/src/modules/splash/splash_page.dart';
import 'package:journal/src/shared/constants/app_routes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.kSplash,
      routes: {
        AppRoutes.kSplash: (context) => SplashPage(),
      },
    );
  }
}
