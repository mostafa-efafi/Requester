import 'package:flutter/material.dart';

class CostumeTabBarView extends StatelessWidget {
  final bool? mini;
  final String title;
  final double? fontSize;
  const CostumeTabBarView({
    super.key,
    required this.title,
    this.mini,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7), color: Colors.black12),
        child: mini == true ? _miniStyle() : _expandedStyle(),
      ),
    );
  }

  FittedBox _miniStyle() {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        title,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fontSize ?? 14),
        overflow: TextOverflow.fade,
      ),
    );
  }

  Row _expandedStyle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            title,
            style: TextStyle(fontSize: fontSize ?? 14),
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
