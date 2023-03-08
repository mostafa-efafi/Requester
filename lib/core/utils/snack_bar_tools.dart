// ignore_for_file: avoid_print, unused_catch_clause

import 'dart:developer';

import 'package:flutter/material.dart';

class SnackBarTools {
  void showIconSnackBar(
      {required String? text,
      required BuildContext? context,
      Color? color,
      IconData? iconC,
      bool hidePreviousSnackBar = false}) {
    if (hidePreviousSnackBar && context != null) {
      try {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      } catch (e) {
        log(e.toString());
      }
    }
    if (context != null) {
      try {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: color,
            duration: Duration(
                milliseconds: _getSnackBarDurationFromTextLenght(text: text!)),
            content: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: RichText(
                      maxLines: 4,
                      softWrap: true,
                      text: TextSpan(
                          text: text,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  Icon(
                    iconC,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            elevation: 5.0,
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      } catch (e) {
        log(e.toString());
      }
    }
  }
}

/// Set snackBar [Duration] automatically with [text size]
int _getSnackBarDurationFromTextLenght({required String text}) {
  final int textLenght = text.length;
  int convertToMilisec = textLenght * 50; //convert to milisecond
  if (convertToMilisec > 20000) convertToMilisec = 20000;
  if (convertToMilisec < 5000) {
    return 2000;
  } else if (convertToMilisec > 10000) {
    return 50000;
  } else {
    return convertToMilisec;
  }
}
