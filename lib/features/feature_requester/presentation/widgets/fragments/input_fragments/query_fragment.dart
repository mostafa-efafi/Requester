import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/core/widgets/custom_textfield.dart';
import 'package:requester/di.dart';
import 'package:requester/features/feature_requester/presentation/bloc/query_fragment_cubit/query_fragment_cubit.dart';

class QueryFragment extends StatelessWidget {
  const QueryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title widget
        _titleWidget(),
        // list of Query Parameters
        Expanded(
          child: BlocConsumer<QueryFragmentCubit, QueryFragmentState>(
            listenWhen: (previous, corrent) {
              if (corrent.queryParamsList!.last.parameter != null &&
                  corrent.queryParamsList!.last.value != null) {
                return true;
              }
              return false;
            },
            listener: (BuildContext context, QueryFragmentState state) {
              di<QueryFragmentCubit>().addNewQuery();
            },
            builder: (context, state) {
              return ListView.builder(
                  itemCount: state.queryParamsList!.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        /// [parameter] textField
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 5),
                          child: CustomTextField(
                            hintText: '${En.parameter} ${index + 1}',
                            onChange: (value) => di<QueryFragmentCubit>()
                                .editParameter(value, index),
                          ),
                        )),

                        /// [value] textField
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 5),
                          child: CustomTextField(
                            hintText: '${En.value} ${index + 1}',
                            onChange: (value) => di<QueryFragmentCubit>()
                                .editValue(value, index),
                          ),
                        )),
                      ],
                    );
                  });
            },
          ),
        )
      ],
    );
  }

  Padding _titleWidget() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            En.queryParameters,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
