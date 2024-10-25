import 'package:flutter/material.dart';
import 'package:requester/core/utils/constants.dart';

class FragmentHeaderWidget extends StatelessWidget {
  final String title;
  const FragmentHeaderWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Constants.fragmentHeaderTitleColor),
          ),
        ],
      ),
    );
  }
}
