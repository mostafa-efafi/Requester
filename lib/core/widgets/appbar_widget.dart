import 'package:flutter/material.dart';
import 'package:requester/config/languages/en.dart';

AppBar appBarWidget(BuildContext context, TabController tabController) {
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    title: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(10)),
      child: const Text(
        En.appName,
        style: TextStyle(color: Colors.white),
      ),
    ),
    bottom: TabBar(
      controller: tabController,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black26,
      tabs: const [
        Tab(
          icon: Icon(Icons.data_object_rounded),
          text: En.inputData,
        ),
        Tab(
          icon: Icon(Icons.cloud_download_rounded),
          text: En.result,
        ),
      ],
    ),
  );
}
