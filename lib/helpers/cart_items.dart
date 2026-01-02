import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_elegance/constant.dart';
import 'package:her_elegance/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:her_elegance/screens/cart_screen.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CartScreen.id);
          },
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: kPrimaryColor,
                  size: 28,
                ),
              ),

              Positioned(
                right: -2,
                top: 8,

                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    '${context.watch<CartCubit>().cartItems.fold(0, (sum, item) => sum + item.quantity)}',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
