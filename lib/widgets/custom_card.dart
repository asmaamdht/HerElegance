import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_elegance/constant.dart';
import 'package:her_elegance/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:her_elegance/cubits/get_wish_list_cubit/get_wish_list_cubit.dart';
import 'package:her_elegance/cubits/get_wish_list_cubit/get_wish_list_state.dart';
import 'package:her_elegance/models/product_model.dart';
import 'package:her_elegance/screens/product_details_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: const Color(0xEAF8E3F3),
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Card(
        color: kCardbg,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailsScreen.id,
                            arguments: product,
                          );
                        },
                        child: Image.network(
                          product.images.first.url,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: kBorderRadius,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            SizedBox(width: 4),
                            Text(
                              product.rating.toString(),
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          context.read<WishListCubit>().toggleWishlist(product);
                        },
                        child: BlocBuilder<WishListCubit, WishListStates>(
                          builder: (context, state) {
                            bool isFavorite = false;

                            for (var p
                                in context
                                    .read<WishListCubit>()
                                    .wishlistItems) {
                              if (p.id == product.id) {
                                isFavorite = true;
                                break;
                              }
                            }
                            return Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite
                                    ? const Color(0xFFF37970)
                                    : kPrimaryColor,
                                size: 20,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                product.title.substring(0, 5),
                style: TextStyle(color: Colors.grey, fontSize: 19),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    r'$'
                    '${product.price.toString()}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addToCart(product);
                    },
                    child: Container(
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
