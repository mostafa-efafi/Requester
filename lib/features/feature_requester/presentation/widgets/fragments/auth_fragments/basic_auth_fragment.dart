import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/core/widgets/custom_textfield.dart';
import 'package:requester/di.dart';
import 'package:requester/features/feature_requester/presentation/bloc/auth_all_fragments_cubit/auth_all_fragments_cubit.dart';
import 'package:requester/features/feature_requester/presentation/widgets/fragment_header_widget.dart';

class BasicAuthFragment extends StatelessWidget {
  const BasicAuthFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title widget
        const FragmentHeaderWidget(title: En.basicAuthentication),
        // list of widgets
        Expanded(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            CustomTextField(
              hintText: En.username,
              onChange: (username) =>
                  di<AuthAllFragmentsCubit>().editBasicAuth(username: username),
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
                hintText: En.password,
                onChange: (pass) =>
                    di<AuthAllFragmentsCubit>().editBasicAuth(password: pass)),
          ],
        ))
      ],
    );
  }
}
