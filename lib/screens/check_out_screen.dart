import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  static String id = 'checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              Image.asset(
                'assets/images/img2.png',
                fit: BoxFit.contain,
                height: 400,
              ),
              Text(
                'Thanks!',
                style: TextStyle(fontSize: 20, fontFamily: kFontFamily),
              ),
              SizedBox(height: 10),
              Text(
                'Your order has been successfully placed',
                style: TextStyle(fontSize: 18, fontFamily: kFontFamily),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
