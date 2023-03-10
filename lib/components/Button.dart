import 'package:chat_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.label, this.color, required this.onPress});
  final Widget label;
  final Color? color;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: label,
        ),
      ),
    );
  }
}
