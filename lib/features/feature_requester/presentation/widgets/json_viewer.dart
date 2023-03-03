import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:requester/core/utils/constants.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/request_status.dart';

class JsonViewer extends StatelessWidget {
  const JsonViewer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state.requestStatus is RequestLoaded) {
          /// [Loaded] response
          final data = state.requestStatus as RequestLoaded;
          return _jsonVContainer(data.response);
        } else if (state.requestStatus is RequestNoAction) {
          /// for sample show json data
          return _jsonVContainer(Constants.sampleJson);
        } else if (state.requestStatus is RequestLoading) {
          return Column(
            children: const [
              CircularProgressIndicator(),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  JsonView _jsonVContainer(Map<String, dynamic> jsonData) {
    return JsonView.map(
      jsonData,
      theme: JsonViewTheme(
        backgroundColor: Colors.grey.shade100,
        closeIcon:
            const Icon(Icons.arrow_drop_up, size: 18, color: Colors.black),
        openIcon:
            const Icon(Icons.arrow_drop_down, size: 18, color: Colors.black),
        stringStyle: TextStyle(
          color: Colors.orange[600],
          fontSize: 16,
        ),
      ),
    );
  }
}
