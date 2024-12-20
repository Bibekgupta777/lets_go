import 'package:demo_test/core/app_theme/app_theme.dart';
import 'package:demo_test/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Test',
      theme: getApplicationTheme(),
      home: const SplashScreen(),
    );
  }
}
