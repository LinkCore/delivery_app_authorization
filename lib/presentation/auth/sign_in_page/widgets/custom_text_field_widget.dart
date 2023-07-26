import 'package:flutter/cupertino.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    required this.placeholder,
    required this.controller,
    this.obscureText = false,
    required this.node,
    super.key,
  });

  final String placeholder;
  final TextEditingController controller;
  final bool obscureText;
  final FocusNode node;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      controller: controller,
      obscureText: obscureText,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      focusNode: node,
      enableSuggestions: false,
      decoration: const BoxDecoration(),
    );
  }
}
