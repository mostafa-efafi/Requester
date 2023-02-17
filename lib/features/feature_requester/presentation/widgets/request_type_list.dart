import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/core/params/request_type_param.dart';
import 'package:requester/features/feature_requester/presentation/bloc/request_type_list_cubit.dart';

class RequestTypeList extends StatelessWidget {
  const RequestTypeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestTypeListCubit, List<RequestTypeParam>>(
      builder: (context, state) {
        return Container(
          height: 35,
          margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          child: Center(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: InkWell(
                      onTap: () =>
                          BlocProvider.of<RequestTypeListCubit>(context)
                              .changeStatus(state[index]),
                      child: Chip(
                          backgroundColor: state[index].isSelected == true
                              ? Colors.teal
                              : Colors.grey,
                          label: Text(
                            state[index].title,
                            style: const TextStyle(color: Colors.white),
                          )),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
