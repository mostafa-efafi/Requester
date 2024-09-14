import 'package:flutter/material.dart';
import 'package:requester/features/feature_requester/presentation/widgets/json_viewer.dart';
import 'package:requester/features/feature_requester/presentation/widgets/status_bar_widget.dart';

class ResultFragment extends StatelessWidget {
  const ResultFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: StatusBarWidget(),
        ),
        JsonViewer(),
      ],
    );
  }
}
