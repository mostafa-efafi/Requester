import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/core/params/request_type_param.dart';
import 'package:requester/features/feature_requester/presentation/bloc/request_type_list_cubit.dart';

class RequestTypeDropDown extends StatelessWidget {
  const RequestTypeDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestTypeListCubit, List<RequestTypeParam>>(
      builder: (context, state) {
        final selectedItem = state.firstWhere((e) => e.isSelected == true);
        return Container(
          // padding: const EdgeInsets.symmetric(vertical: 2),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          width: 85,
          height: 40,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButton<String>(
            value: selectedItem.title,
            onChanged: (value) {
              final newSelectedItem = state.firstWhere((e) => e.title == value);
              BlocProvider.of<RequestTypeListCubit>(context)
                  .changeStatus(newSelectedItem);
            },
            hint: Center(
                child: Text(
              state.first.title,
              style: const TextStyle(color: Colors.white ,),
            )),
            // Hide the default underline
            underline: Container(),
            // set the color of the dropdown menu
            dropdownColor: Colors.white,
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: Colors.white,
            ),
            isExpanded: true,

            // The list of options
            items: state
                .map((e) => DropdownMenuItem(
                      value: e.title,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          e.title,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ))
                .toList(),

            // Customize the selected item
            selectedItemBuilder: (BuildContext context) => state
                .map((e) => Center(
                      child: Text(
                        e.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14
                        ),
                      ),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
