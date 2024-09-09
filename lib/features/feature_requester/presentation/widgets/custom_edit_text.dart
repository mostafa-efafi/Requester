import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:requester/config/languages/en.dart';
import 'package:requester/features/feature_requester/presentation/widgets/request_type_dropdown.dart';

class CustomEditText extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChange;
  final String? errorText;
  const CustomEditText(
      {super.key, required this.controller, this.onChange, this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: controller,
        onChanged: onChange,
        enableInteractiveSelection: true,
        textInputAction: TextInputAction.go,
        style: TextStyle(color: Colors.grey[800]),
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.teal),
            ),
            hintText: En.enterUrl,
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: _pasteButton(),
            prefixIcon: const RequestTypeDropDown(),
            labelStyle: const TextStyle(color: Colors.grey),
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            errorText: errorText),
      ),
    );
  }

  Widget _pasteButton() {
    return InkWell(
      onTap: () {
        FlutterClipboard.paste().then((value) {
          controller.text = value;
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
