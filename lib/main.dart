import 'dart:io';

import 'package:flutter/material.dart';
import 'package:requester/config/app_theme.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/di.dart';

import 'features/feature_requester/presentation/pages/home_page.dart';

Future<void> main() async {
  ///  init locator
  await setupDI();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: En.appName,
      theme: appThemeData(),
      home: const HomePage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
