import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requester/core/widgets/small_button.dart';
import 'package:requester/di.dart';
import 'package:requester/features/feature_requester/presentation/bloc/result_fragment_cubit/result_fragment_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebViewWidget extends StatefulWidget {
  final String htmlContent;
  const MyWebViewWidget({super.key, required this.htmlContent});

  @override
  State<MyWebViewWidget> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<MyWebViewWidget> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _controller.loadHtmlString(widget.htmlContent);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ResultFragmentCubit, ResultFragmentState>(
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              height: size.height * 0.7,
              child: state.showHtml
                  ? WebViewWidget(
                      controller: _controller,
                    )
                  : SingleChildScrollView(child: Text(widget.htmlContent)),
            ),

            /// opration [buttons]
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// copy button
                SmallButton(
                  onPressed: () {
                    /// copy content to [Clipboard]
                    FlutterClipboard.copy(widget.htmlContent);
                  },
                  icon: Icons.copy_all_rounded,
                ),

                /// button for show html content
                SmallButton(
                  isOn: state.showHtml,
                  onPressed: () =>
                      di<ResultFragmentCubit>().changeShowHtmlCheckBoxState(),
                  icon: Icons.html_rounded,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
