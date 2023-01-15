import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class Input extends StatelessWidget {
  const Input({super.key, this.placeholder, required this.controller});
  final String? placeholder;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintStyle: kInputPlaceholderTextStyle,
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFD09CFA),
            width: 1,
          ),
        ),
        hintText: placeholder,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 3),
        ),
      ),
    );
    ;
  }
}
