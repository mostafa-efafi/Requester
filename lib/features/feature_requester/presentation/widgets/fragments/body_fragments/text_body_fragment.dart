import 'package:flutter/widgets.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragment_header_widget.dart';

class TextBodyFragment extends StatelessWidget {
  const TextBodyFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // title widget
        FragmentHeaderWidget(title: 'Text Content'),
        // list of widgets
        Expanded(
            child: Center(
          child: Text('json'),
        ))
      ],
    );
  }
}