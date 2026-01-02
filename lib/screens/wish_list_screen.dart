import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_elegance/constant.dart';
import 'package:her_elegance/cubits/get_wish_list_cubit/get_wish_list_cubit.dart';
import 'package:her_elegance/cubits/get_wish_list_cubit/get_wish_list_state.dart';
import 'package:her_elegance/helpers/arrow_back.dart';
import 'package:her_elegance/helpers/cart_items.dart';
import 'package:her_elegance/helpers/page_empty.dart';
import 'package:her_elegance/screens/product_details_screen.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});
  static String id = 'wishListScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kPageBg,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArrowBack(),

                  Text(
                    'Wish List',
                    style: TextStyle(color: kTextColor, fontSize: 20),
                  ),
                  CartItems(),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<WishListCubit, WishListStates>(
                builder: (context, state) {
                  final wishlist = BlocProvider.of<WishListCubit>(
                    context,
                  ).wishlistItems;

                  if (wishlist.isEmpty) {
                    return PageEmpty(text: 'Your Wish List is Empty');
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: wishlist.length,
                    itemBuilder: (context, index) {
                      final product = wishlist[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: kBorderRadius,
                              color: kPrimaryBgColor,
                            ),

                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 18,
                                right: 18,
                                top: 0,
                                bottom: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: kBorderRadius,
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
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        right: 0,
                                        top: 13,
                                        child: GestureDetector(
                                          onTap: () {
                                            (context)
                                                .read<WishListCubit>()
                                                .toggleWishlist(product);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.favorite,
                                              color: const Color(0xFFF37970),
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 5),

                                  Text(
                                    product.title.substring(0, 6),
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: kFontFamily,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    r'$'
                                    '${product.price}',
                                    style: TextStyle(
                                      color: const Color(0xFF404040),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
