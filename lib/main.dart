import 'package:flutter/material.dart';
import 'package:requester/config/app_theme.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/di.dart';

import 'features/feature_requester/presentation/pages/home_page.dart';

Future<void> main() async {
  ///  init locator
  await setupDI();
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
