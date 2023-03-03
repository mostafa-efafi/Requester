import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/core/params/sent_param.dart';
import 'package:requester/core/rest/rest_api.dart';
import 'package:requester/core/utils/constants.dart';
import 'package:requester/di.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:requester/features/feature_requester/presentation/bloc/request_type_list_cubit.dart';
import 'package:requester/features/feature_requester/presentation/widgets/body_fields_generator.dart';
import 'package:requester/features/feature_requester/presentation/widgets/custom_edit_text.dart';
import 'package:requester/features/feature_requester/presentation/widgets/json_viewer.dart';
import 'package:requester/features/feature_requester/presentation/widgets/request_type_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// for [url] textField
  TextEditingController urlTextController = TextEditingController();
  TextEditingController postBodyTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(En.appName),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di<RequestTypeListCubit>()),
          BlocProvider(create: (_) => di<HomePageBloc>())
        ],
        child: Builder(builder: (builderContext) {
          return ListView(
            shrinkWrap: false,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  const RequestTypeList(),
                  CustomEditText(controller: urlTextController),
                  const SizedBox(
                    height: 10,
                  ),
                  BodyFieldsGenerator(
                      postBodyTextController: postBodyTextController),
                  _sendButton(builderContext),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const JsonViewer(),
            ],
          );
        }),
      ),
    );
  }

  MaterialButton _sendButton(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).colorScheme.secondary,
      onPressed: () {
        /// find selected request type
        final requestTypeParam = BlocProvider.of<RequestTypeListCubit>(context)
            .state
            .firstWhere((element) => element.isSelected == true);
        final sentParam = SentParam(
            requestType: requestTypeParam.requestType,
            url: urlTextController.text,
            postBody: requestTypeParam.requestType == RequestType.postRequest
                ? json.decode(postBodyTextController.text)
                : null);

        /// send request Bloc Event
        BlocProvider.of<HomePageBloc>(context).add(SendRequestEvent(sentParam));
      },
      child: const Text(
        En.send,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
