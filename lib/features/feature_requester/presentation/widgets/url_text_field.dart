import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/core/widgets/custom_textfield.dart';
import 'package:requester/features/feature_requester/presentation/widgets/request_type_dropdown.dart';

class UrlTextField extends CustomTextField {
  const UrlTextField(
      {super.key, required super.controller, super.onChange, super.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: CustomTextField(
        controller: controller,
        onChange: onChange,
        errorText: errorText,
        prefixIcon: const RequestTypeDropDown(),
        suffixIcon: _pasteButton(),
        hintText: En.enterUrl,
      ),
    );
  }

  Widget _pasteButton() {
    return InkWell(
      onTap: () {
        FlutterClipboard.paste().then((value) {
          controller?.text = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: const Color(0x11000000),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          Icons.paste_rounded,
          size: 23,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
