import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/core/utils/constants.dart';
import 'package:requester/features/feature_requester/presentation/bloc/request_type_list_cubit.dart';
import 'package:requester/features/feature_requester/presentation/widgets/custom_edit_text.dart';
import 'package:requester/features/feature_requester/presentation/widgets/json_viewer.dart';
import 'package:requester/features/feature_requester/presentation/widgets/request_type_list.dart';

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
      body: BlocProvider(
        create: (context) => RequestTypeListCubit(),
        child: ListView(
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                const RequestTypeList(),
                CustomEditText(controller: TextEditingController()),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {},
                  child: const Text(
                    En.send,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const JsonViewer(),
          ],
        ),
      ),
    );
  }
}
