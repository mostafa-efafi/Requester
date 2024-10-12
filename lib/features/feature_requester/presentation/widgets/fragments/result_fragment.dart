import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/core/widgets/my_webview_widget.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/request_status.dart';
import 'package:requester/features/feature_requester/presentation/widgets/json_viewer.dart';
import 'package:requester/features/feature_requester/presentation/widgets/status_bar_widget.dart';

class ResultFragment extends StatelessWidget {
  const ResultFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: StatusBarWidget(),
        ),
        BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            /// [Loaded] response
            if (state.requestStatus is RequestLoaded) {
              final data = (state.requestStatus as RequestLoaded).response.data;
              return data!.startsWith('{') || data.startsWith('[')
                  ? const JsonViewer()
                  : MyWebViewWidget(htmlContent: data);
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
