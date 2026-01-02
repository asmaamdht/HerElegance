import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_elegance/constant.dart';
import 'package:her_elegance/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:her_elegance/helpers/arrow_back.dart';
import 'package:her_elegance/helpers/cart_items.dart';
import 'package:her_elegance/helpers/wish_list.dart';
import 'package:her_elegance/models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static String id = 'productDetails';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(370),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryBgColor,
            flexibleSpace: SafeArea(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ArrowBack(),
                            Row(
                              children: [
                                WishList(),
                                SizedBox(width: 10),
                                CartItems(),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFCCCCFF),
                                      borderRadius: kBorderRadius,
                                    ),
                                    child: Image.network(
                                      product.images[0].url,
                                      height: 80,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFE4E1),
                                      borderRadius: kBorderRadius,
                                    ),
                                    child: Image.network(
                                      product.images[1].url,
                                      height: 80,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: kPageBg,
                                      borderRadius: kBorderRadius,
                                    ),
                                    child: Image.network(
                                      product.images[2].url,
                                      height: 80,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                product.images.first.url,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.category, style: TextStyle(color: kPrimaryColor)),
                Text(
                  product.brand ?? "",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              product.title,
              style: TextStyle(fontSize: 20, fontFamily: kFontFamily),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 20),
                SizedBox(width: 4),
                Text(
                  product.rating.toString(),
                  style: TextStyle(color: kPrimaryColor, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Product Information',
              style: TextStyle(fontSize: 20, color: kPrimaryColor),
            ),
            SizedBox(height: 15),
            Text(
              product.description,
              style: TextStyle(color: const Color(0xFF616161)),
            ),

            SizedBox(height: 15),
            Text(
              "Dimensions",
              style: TextStyle(fontSize: 20, color: kPrimaryColor),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Width:',
                          style: TextStyle(
                            color: Color.fromARGB(255, 227, 182, 177),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          product.dimensions.width.toString(),
                          style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Height:',
                          style: TextStyle(
                            color: Color(0xFF5D5DA0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          product.dimensions.height.toString(),
                          style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'depth:',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 204, 189, 162),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          product.dimensions.depth.toString(),
                          style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    r'$'
                    '${product.price.toString()}',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<CartCubit>().addToCart(product);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
