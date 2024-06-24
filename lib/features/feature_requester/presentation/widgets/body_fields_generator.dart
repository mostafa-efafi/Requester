import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/core/params/request_type_param.dart';
import 'package:requester/core/rest/rest_api.dart';
import 'package:requester/core/utils/itegration_test_keys.dart';
import 'package:requester/features/feature_requester/presentation/bloc/request_type_list_cubit.dart';

class BodyFieldsGenerator extends StatelessWidget {
  final TextEditingController postBodyTextController;
  const BodyFieldsGenerator({super.key, required this.postBodyTextController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestTypeListCubit, List<RequestTypeParam>>(
      builder: (context, state) {
        final selectedParam =
            state.firstWhere((element) => element.isSelected == true);
        return selectedParam.requestType == RequestType.postRequest
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _postBodyEditText(),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        // Expanded(child: TextField()),
                      ],
                    ),

                    /// TODO [add option for next version]
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10),
                    //   child: FloatingActionButton(
                    //     backgroundColor: Colors.blueGrey,
                    //     mini: true,
                    //     heroTag: null,
                    //     onPressed: () {},
                    //     child: const Icon(Icons.add),
                    //   ),
                    // )
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }

  Expanded _postBodyEditText() {
    return Expanded(
        child: TextField(
      key: IntegrationTestKeys.iPostBodyEditTextKey,
      controller: postBodyTextController,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.teal),
        ),
        hintText: 'Json Body',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        isDense: true,
      ),
    ));
  }
}
