import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';
import 'package:her_elegance/screens/cart_screen.dart';
import 'package:her_elegance/screens/home_screen.dart';
import 'package:her_elegance/screens/profile_screen.dart';
import 'package:her_elegance/widgets/custom_footer_item.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key, required this.currentIndex});

  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 230,
              height: 60,
              decoration: BoxDecoration(
                color: kPrimaryBgColor.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF565656).withValues(alpha: 0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FooterItem(
                    icon: Icons.home,
                    isActive: currentIndex == 0,
                    onTap: () {
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                  ),
                  FooterItem(
                    icon: Icons.shopping_cart,
                    onTap: () {
                      Navigator.pushNamed(context, CartScreen.id);
                    },
                    isActive: currentIndex == 1,
                  ),

                  // FooterItem(
                  //   icon: Icons.event,
                  //   isActive: currentIndex == 2,
                  //   onTap: () {},
                  // ),
                  // FooterItem(
                  //   icon: Icons.person,
                  //   isActive: currentIndex == 2,
                  //   onTap: () {
                  //     Navigator.pushNamed(context, ProfileScreen.id);
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
