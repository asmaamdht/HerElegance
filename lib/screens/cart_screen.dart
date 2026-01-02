import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_elegance/constant.dart';
import 'package:her_elegance/cubits/get_product_cubit/get_product_cubit.dart';
import 'package:her_elegance/cubits/get_product_cubit/get_product_state.dart';
import 'package:her_elegance/models/product_model.dart';
import 'package:her_elegance/screens/check_out_screen.dart';
import 'package:her_elegance/widgets/custom_cart_app.dart';
import 'package:her_elegance/helpers/page_empty.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static String id = 'cartScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),

        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: kPageBg,
          title: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CustomCartApp(),
          ),
        ),
      ),
      body: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          List<ProductModel> cartItems = [];
          if (state is CartUpdated) {
            cartItems = state.productModel;
          }

          if (cartItems.isEmpty) {
            return PageEmpty(text: 'Your Cart Is Empty');
          }

          double total = cartItems.fold(
            0,
            (sum, item) => sum + item.price.toDouble() * item.quantity,
          );
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (BuildContext context, index) {
                    final product = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 20,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadius,
                          color: kPrimaryBgColor,
                        ),
                        height: 120,

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: kSecondBgColor,
                                      borderRadius: kBorderRadius,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: kBorderRadius,
                                      child: Image.network(
                                        product.images.first.url,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 20),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.title.substring(0, 5),
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          product.description.substring(0, 15),
                                          style: TextStyle(color: kTextColor),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          r'$'
                                          '${(product.price * product.quantity)..toStringAsFixed(2)} ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(width: 10),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<CartCubit>()
                                              .removeFromCart(product);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 25),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<CartCubit>()
                                                  .increaseQuantity(product);
                                            },
                                            child: Icon(
                                              Icons.add_circle_outline,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '${product.quantity}',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(width: 5),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<CartCubit>()
                                                  .decreaseQuantity(product);
                                            },
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: kBorderRadius,
                  color: kPrimaryBgColor,
                  boxShadow: [
                    BoxShadow(blurRadius: 10, color: const Color(0xEAF8E3F3)),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          r'$'
                          '${total.toStringAsFixed(4)}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CheckOutScreen.id);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: kBorderRadius,
                        ),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
