import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

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
                borderRadius: BorderRadius.all(Radius.circular(5))),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.teal),
            ),
            hintText: 'Enter URL',
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: _pasteButton(),
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
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        decoration: const BoxDecoration(
            color: Color(0x11000000), shape: BoxShape.circle),
        child: Icon(
          Icons.paste_rounded,
          size: 25,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}
