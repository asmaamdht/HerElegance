import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';
import 'package:her_elegance/screens/wish_list_screen.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, WishListScreen.id);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(Icons.favorite, color: kPrimaryColor, size: 28),
      ),
    );
  }
}
