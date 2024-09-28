// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/core/utils/itegration_test_keys.dart';
import 'package:requester/core/utils/snack_bar_tools.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/request_status.dart';
import 'package:requester/features/feature_requester/presentation/widgets/url_text_field.dart';
import 'package:requester/features/feature_requester/presentation/widgets/input_data_tab_controller.dart';

class InputDataFragment extends StatelessWidget {
  InputDataFragment(
      {super.key,
      required this.urlTextController,
      required this.postBodyTextController});
  final TextEditingController urlTextController;
  final TextEditingController postBodyTextController;
  final snackBarTools = SnackBarTools();

  /// for [url] textField

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state.requestStatus is RequestError) {
            final data = state.requestStatus as RequestError;
            snackBarTools.showIconSnackBar(
                text: data.errorMessage,
                context: context,
                color: Colors.red,
                hidePreviousSnackBar: true,
                iconC: Icons.error_rounded);
          }
        },
        child: CustomScrollView(
          shrinkWrap: false,
          primary: true,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  UrlTextField(
                    controller: urlTextController,
                    key: IntegrationTestKeys.iEditTextKey,
                  ),
                  // const SizedBox(height: 10),
                ],
              ),
            ),

            /// [InputDataTabController]
            const SliverFillRemaining(
              fillOverscroll: true,
              hasScrollBody: true,
              child: InputDataTabController(),
            )
          ],
        ));
  }
}
