import 'package:flutter/material.dart';
import 'package:requester/core/widgets/custom_tabbar_view.dart';
import 'package:requester/core/widgets/tabbar_outline_Indicator.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/body_fragments/binary_body_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/body_fragments/form_body_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/body_fragments/json_body_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/body_fragments/text_body_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/body_fragments/xml_body_fragment.dart';

class BodyFragment extends StatelessWidget {
  const BodyFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          TabBar(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            labelPadding:
                const EdgeInsets.only(left: 3, right: 3, bottom: 0, top: 0),
            indicator: const TabBarOutlineIndicator(),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding:
                const EdgeInsets.only(left: 0, right: 0, bottom: 5, top: 13),
            automaticIndicatorColorAdjustment: true,
            enableFeedback: true,
            unselectedLabelColor: Colors.black26,
            labelColor: Colors.white,
            dividerColor: Colors.transparent,
            tabs: const [
              CostumeTabBarView(
                title: 'JSON',
                fontSize: 12,
                mini: true,
              ),
              CostumeTabBarView(
                title: 'XML',
                fontSize: 12,
                mini: true,
              ),
              CostumeTabBarView(
                title: 'Text',
                fontSize: 12,
                mini: true,
              ),
              CostumeTabBarView(
                title: 'Form',
                fontSize: 12,
                mini: true,
              ),
              CostumeTabBarView(
                title: 'Binary',
                fontSize: 12,
                mini: true,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                JsonBodyFragment(),
                XMLBodyFragment(),
                TextBodyFragment(),
                FormBodyFragment(),
                BinaryBodyFragment(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
