import 'package:flutter/material.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/core/widgets/costume_tabbar_view.dart';
import 'package:requester/core/widgets/tabbar_outline_Indicator.dart';

class AuthFragment extends StatelessWidget {
  const AuthFragment({super.key});

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
                title: 'Basic',
                fontSize: 12,
              ),
              CostumeTabBarView(
                title: 'Bearer',
                fontSize: 12,
              ),
              CostumeTabBarView(
                title: 'OAuth 2',
                fontSize: 12,
              ),
              CostumeTabBarView(
                title: 'NTLM',
                fontSize: 12,
              ),
              CostumeTabBarView(
                title: 'AWS',
                fontSize: 12,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Icon(Icons.abc_sharp),
                Icon(Icons.abc_sharp),
                Icon(Icons.abc_sharp),
                Icon(Icons.abc_sharp),
                Icon(Icons.abc_sharp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
