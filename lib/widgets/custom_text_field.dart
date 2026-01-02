import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.onChange,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String? hintText;
  final Function(String)? onChange;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: kTextColor),
      cursorColor: kPrimaryColor,
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return ' data is required';
        }
        return null;
      },
      onChanged: onChange,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,

        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFF595959)),
        enabledBorder: OutlineInputBorder(
          borderRadius: kBorderRadius,
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: kBorderRadius,

          borderSide: BorderSide(color: kPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: kBorderRadius,
          borderSide: BorderSide(color: kPrimaryColor),
        ),
      ),
    );
  }
}
