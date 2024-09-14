import 'package:flutter/material.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/core/widgets/costume_tabbar_view.dart';
import 'package:requester/core/widgets/tabbar_outline_Indicator.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/input_fragments/auth_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/input_fragments/body_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/input_fragments/headers_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/input_fragments/query_fragment.dart';

class InputDataTabController extends StatelessWidget {
  const InputDataTabController({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            labelPadding:
                const EdgeInsets.only(left: 4, right: 4, bottom: 0, top: 0),
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
                title: En.query,
              ),
              CostumeTabBarView(
                title: En.headers,
              ),
              CostumeTabBarView(
                title: En.auth,
              ),
              CostumeTabBarView(
                title: En.body,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                QueryFragment(),
                HeadersFragment(),
                AuthFragment(),
                BodyFragment()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
