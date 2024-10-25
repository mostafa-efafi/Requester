import 'package:flutter/material.dart';
import 'package:requester/core/utils/constants.dart';

class SmallButton extends StatelessWidget {
  final bool? isOn;
  final void Function() onPressed;
  final IconData icon;
  const SmallButton(
      {super.key, this.isOn, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      mini: true,
      backgroundColor: isOn != null
          ? isOn == true
              ? Constants.primaryColor
              : Colors.white
          : Constants.primaryColor,
      child: Icon(
        icon,
        color: isOn != null
            ? isOn == true
                ? Colors.white
                : Constants.fragmentHeaderTitleColor
            : Colors.white,
      ),
    );
  }
}
