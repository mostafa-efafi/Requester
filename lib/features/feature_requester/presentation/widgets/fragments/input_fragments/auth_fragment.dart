import 'package:flutter/material.dart';
import 'package:requester/core/widgets/custom_tabbar_view.dart';
import 'package:requester/core/widgets/tabbar_outline_Indicator.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/auth_fragments/aws_auth_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/auth_fragments/basic_auth_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/auth_fragments/bearer_auth_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/auth_fragments/jwt_auth_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragments/auth_fragments/oauth1_auth_fragment.dart';

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
                mini: true,
              ),
              CostumeTabBarView(
                title: 'Bearer',
                fontSize: 12,
                mini: true,
              ),
              CostumeTabBarView(
                title: 'OAuth 1',
                fontSize: 12,
                mini: true,
              ),
              CostumeTabBarView(
                title: 'JWT',
                fontSize: 12,
                mini: true,
              ),
              CostumeTabBarView(
                title: 'AWS',
                fontSize: 12,
                mini: true,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                BasicAuthFragment(),
                BearerAuthFragment(),
                OAuth1AuthFragment(),
                JWTAuthFragment(),
                AWSAuthFragment(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
