import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';

class PageEmpty extends StatelessWidget {
  const PageEmpty({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Image.asset('assets/images/cart.png', height: 400),
          Text(
            text,
            style: TextStyle(
              fontSize: 25,
              color: kPrimaryColor,
              fontFamily: kFontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
