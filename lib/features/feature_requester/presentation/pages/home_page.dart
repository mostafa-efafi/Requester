import 'package:flutter/material.dart';
import 'package:requester/core/utils/constants.dart';
import 'package:requester/core/widgets/appbar_widget.dart';
import 'package:requester/di.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:requester/features/feature_requester/presentation/widgets/input_data_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/result_fragment.dart';
import 'package:requester/features/feature_requester/presentation/widgets/send_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static const tabLength = 2;
  TextEditingController urlTextController = TextEditingController();
  TextEditingController postBodyTextController = TextEditingController();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: tabLength, vsync: this);
    di<HomePageBloc>().tabController = tabController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabLength,
      child: Scaffold(
        backgroundColor: Constants.scaffoldBackgroundColor,
        appBar: appBarWidget(context, tabController),
        body: TabBarView(
          controller: tabController,
          children: [
            /// input Data [fragment]
            InputDataFragment(
              urlTextController: urlTextController,
              postBodyTextController: postBodyTextController,
            ),

            /// result [fragment]
            const ResultFragment(),
          ],
        ),
        floatingActionButton: SendButton(
            urlTextController: urlTextController,
            postBodyTextController: postBodyTextController),
      ),
    );
  }
}
