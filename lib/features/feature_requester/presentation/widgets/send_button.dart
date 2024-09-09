import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/core/params/sent_param.dart';
import 'package:requester/core/widgets/loading_widget.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/request_status.dart';
import 'package:requester/features/feature_requester/presentation/bloc/request_type_list_cubit.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.urlTextController,
    required this.postBodyTextController,
  });

  final TextEditingController urlTextController;
  final TextEditingController postBodyTextController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: state.requestStatus is RequestLoading
              ? null
              : () {
                  /// find selected request type
                  final requestTypeParam =
                      BlocProvider.of<RequestTypeListCubit>(context)
                          .state
                          .firstWhere((element) => element.isSelected == true);
                  final sentParam = SentParam(
                      requestType: requestTypeParam.requestType,
                      url: urlTextController.text,
                      postBody: requestTypeParam.withBody == true &&
                              postBodyTextController.text != ''
                          ? json.decode(postBodyTextController.text)
                          : null);

                  /// send request Bloc Event
                  BlocProvider.of<HomePageBloc>(context)
                      .add(SendRequestEvent(sentParam));
                },
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          child: state.requestStatus is RequestLoading
              ? const LoadingWidget()
              : const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                ),
        );
      },
    );
  }
}
