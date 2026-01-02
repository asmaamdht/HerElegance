import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';
import 'package:her_elegance/helpers/cart_items.dart';
import 'package:her_elegance/helpers/wish_list.dart';

class HomeApp extends StatelessWidget {
  final String? username;
  const HomeApp({super.key, this.username});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        flexibleSpace: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 0,
              top: -30,
              child: Image.asset('assets/images/home.png', width: 250),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$username !',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Let’s start shopping!',
                        style: TextStyle(
                          color: Color(0xFFEBEBEB),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [WishList(), SizedBox(width: 10), CartItems()],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
