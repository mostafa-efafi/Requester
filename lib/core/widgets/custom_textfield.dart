import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  const CustomTextField(
      {super.key,
       this.controller,
      this.onChange,
      this.errorText,
      this.suffixIcon,
      this.prefixIcon,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          labelStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          errorText: errorText),
    );
  }
}
