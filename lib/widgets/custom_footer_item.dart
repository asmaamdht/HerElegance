import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';

class FooterItem extends StatelessWidget {
  const FooterItem({
    super.key,
    required this.icon,
    required this.onTap,
    this.isActive = false,
    this.activeIcon = kPrimaryColor,
    this.iconColor = Colors.white,
    this.badgeCount = 0,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final bool isActive;
  final Color activeIcon;
  final Color iconColor;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isActive ? kPrimaryColor : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isActive ? Colors.white : kPrimaryColor,
                ),
              ),
            ],
          ),
          if (badgeCount > 0)
            Positioned(
              right: -4,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withValues(alpha: 0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                child: Center(
                  child: Text(
                    badgeCount > 9 ? '9+' : badgeCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
