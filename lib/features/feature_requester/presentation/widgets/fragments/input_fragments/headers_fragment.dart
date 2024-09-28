import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/core/widgets/custom_textfield.dart';
import 'package:requester/di.dart';
import 'package:requester/features/feature_requester/presentation/bloc/header_fragment_cubit/header_fragment_cubit.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragment_header_widget.dart';

class HeadersFragment extends StatelessWidget {
  const HeadersFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title widget
        const FragmentHeaderWidget(title: En.hTTPHeaders),
        // list of Query Parameters
        Expanded(
          child: BlocConsumer<HeaderFragmentCubit, HeaderFragmentState>(
            listenWhen: (previous, corrent) {
              if (corrent.headerParamsList!.last.parameter != null &&
                  corrent.headerParamsList!.last.value != null) {
                return true;
              }
              return false;
            },
            listener: (BuildContext context, HeaderFragmentState state) {
              di<HeaderFragmentCubit>().addNewQuery();
            },
            builder: (context, state) {
              return ListView.builder(
                  itemCount: state.headerParamsList!.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        /// [parameter] textField
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 5),
                          child: CustomTextField(
                            hintText: '${En.header} ${index + 1}',
                            onChange: (value) => di<HeaderFragmentCubit>()
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
                            onChange: (value) => di<HeaderFragmentCubit>()
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
}
