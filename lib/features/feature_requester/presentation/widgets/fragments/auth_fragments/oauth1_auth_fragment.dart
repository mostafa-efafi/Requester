import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragment_header_widget.dart';

class OAuth1AuthFragment extends StatelessWidget {
  const OAuth1AuthFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // title widget
        FragmentHeaderWidget(title: En.oAuth1Authentication),
        // list of widgets
        Expanded(
            child: Center(
          child: Text(En.nextVersionFuture),
        ))
      ],
    );
  }
}
