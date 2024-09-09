import 'package:flutter/material.dart';

ThemeData appThemeData({BuildContext? context}) {
  return ThemeData(
    fontFamily: 'Vazir',
    useMaterial3: true,
    primaryColor: Colors.teal,
    secondaryHeaderColor: Colors.amber,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.amber,
      primary: Colors.teal,
      brightness: Brightness.light,
    ),
    brightness: Brightness.light,
    unselectedWidgetColor: Colors.grey[600],
  );
}
