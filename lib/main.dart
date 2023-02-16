import 'package:flutter/material.dart';
import 'package:requester/config/app_theme.dart';
import 'package:requester/config/languages/en.dart';

import 'features/feature_requester/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: En.appName,
      theme: appThemeData(),
      home: const HomePage(),
    );
  }
}
