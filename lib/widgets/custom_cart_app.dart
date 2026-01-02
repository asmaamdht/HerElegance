import 'package:flutter/material.dart';
import 'package:her_elegance/helpers/arrow_back.dart';

class CustomCartApp extends StatelessWidget {
  const CustomCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ArrowBack(),
        const SizedBox(width: 100),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('Cart'),
          ),
        ),
      ],
    );
  }
}
