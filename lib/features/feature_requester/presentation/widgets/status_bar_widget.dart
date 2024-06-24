import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:requester/features/feature_requester/presentation/bloc/home_page_bloc/request_status.dart';

class StatusBarWidget extends StatelessWidget {
  const StatusBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white, fontSize: 12);
    const textSuccess = TextStyle(color: Color(0xFF76FF03), fontSize: 12);
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return state.requestStatus is RequestLoaded
            ? _widgetContainer(textStyle, textSuccess, state)
            : const SizedBox();
      },
    );
  }

  Container _widgetContainer(
      TextStyle textStyle, TextStyle textSuccess, HomePageState state) {
    final data = state.requestStatus as RequestLoaded;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(
        horizontal: 7,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[700], borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Status: ',
                style: textStyle,
              ),
              Text(
                '${data.response.statusCode} ',
                style: textSuccess,
              ),
              Text('${data.response.statusMessage} ', style: textSuccess),
            ],
          ),
          Row(
            children: [
              Text(
                'Type: ',
                style: textStyle,
              ),
              Text(data.response.resultType.toString().split('.').last,
                  style: textSuccess),
            ],
          ),
          Row(
            children: [
              Text(
                'Time: ',
                style: textStyle,
              ),
              Text('-', style: textSuccess),
            ],
          ),
        ],
      ),
    );
  }
}
