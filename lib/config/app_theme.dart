import 'package:flutter/material.dart';
import 'package:requester/core/utils/constants.dart';

ThemeData appThemeData({BuildContext? context}) {
  return ThemeData(
    fontFamily: 'Vazir',
    useMaterial3: true,
    primaryColor: Constants.primaryColor,
    secondaryHeaderColor: Constants.secondaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Constants.secondaryColor,
      primary: Constants.primaryColor,
      brightness: Brightness.light,
    ),
    brightness: Brightness.light,
    unselectedWidgetColor: Constants.fragmentHeaderTitleColor,
  );
}
