import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  const LoadingWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    final loadingColor = color ?? Colors.white;
    return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(loadingColor));
  }
}
