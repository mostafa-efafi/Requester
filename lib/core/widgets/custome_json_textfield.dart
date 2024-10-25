import 'package:flutter/material.dart';
import 'package:json_text_field/json_text_field.dart';

class CustomeJsonTextField extends StatelessWidget {
  const CustomeJsonTextField({
    super.key,
    required this.controller,
  });

  final JsonTextFieldController controller;
  final outlineInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
      borderRadius: BorderRadius.all(Radius.circular(15)));

  @override
  Widget build(BuildContext context) {
    return JsonTextField(
      maxLines: 10,
      autocorrect: true,
      controller: controller,
      isFormatting: true,
      showErrorMessage: false,
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusedErrorBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: outlineInputBorder,
          // focusedBorder: outlineInputBorder,
          filled: true,
          border: outlineInputBorder),
      keyHighlightStyle: TextStyle(color: Colors.grey.shade600),
      stringHighlightStyle: const TextStyle(color: Colors.black),
      numberHighlightStyle: TextStyle(color: Colors.blue.shade600),
      boolHighlightStyle: const TextStyle(color: Colors.purple),
      nullHighlightStyle: const TextStyle(color: Colors.orange),
      specialCharHighlightStyle: const TextStyle(color: Colors.green),
      errorTextStyle: const TextStyle(color: Colors.red),
    );
  }
}
