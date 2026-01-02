import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: kBorderRadius,
            color: kPrimaryBgColor,
          ),
          width: 65,
          height: 65,
          child: Center(child: Text(text, style: TextStyle(fontSize: 30))),
        ),
      ),
    );
  }
}
