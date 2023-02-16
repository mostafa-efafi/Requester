import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/core/utils/constants.dart';
import 'package:requester/features/feature_requester/presentation/widgets/custom_edit_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(En.appName),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          CustomEditText(controller: TextEditingController())],
      ),
    );
  }
}
