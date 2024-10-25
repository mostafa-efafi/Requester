import 'package:flutter/material.dart';
import 'package:json_text_field/json_text_field.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/core/widgets/custome_json_textfield.dart';
import 'package:requester/core/widgets/small_button.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragment_header_widget.dart';

class JsonBodyFragment extends StatelessWidget {
  JsonBodyFragment({super.key});
  final JsonTextFieldController controller = JsonTextFieldController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title widget
        const FragmentHeaderWidget(title: En.jsonContent),
        // list of widgets
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              /// [json text field] widget
              CustomeJsonTextField(controller: controller),
              Positioned(
                right: 5,
                top: 5,
                child: SmallButton(
                    onPressed: () => controller.formatJson(sortJson: true),
                    icon: Icons.sort_rounded),
              ),
            ],
          ),
        ))
      ],
    );
  }
}

