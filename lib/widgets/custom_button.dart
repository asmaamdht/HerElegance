import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: kPrimaryBgColor,
          borderRadius: kBorderRadius,
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
