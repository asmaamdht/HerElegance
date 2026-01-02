import 'package:flutter/material.dart';
import 'package:her_elegance/constant.dart';
import 'package:her_elegance/models/product_model.dart';
import 'package:her_elegance/screens/footer_screen.dart';
import 'package:her_elegance/services/category_servece.dart';
import 'package:her_elegance/widgets/custom_card.dart';
import 'package:her_elegance/widgets/custom_categories.dart';
import 'package:her_elegance/widgets/home_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService productService = ProductService();
  String categoryUrlSelected =
      "https://dummyjson.com/products/category/womens-bags";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    final username = args?['username'] ?? 'User';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: HomeApp(username: username),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Category', style: TextStyle(fontSize: 30)),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: CustomCategories(
                    onCategoryTap: (String url) {
                      setState(() {
                        categoryUrlSelected = url;
                      });
                    },
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: FutureBuilder<List<ProductModel>>(
                    future: productService.getProductsByCategory(
                      categoryUrlSelected,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<ProductModel> product = snapshot.data!;
                        return GridView.builder(
                          itemCount: product.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.7,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 20,
                              ),
                          itemBuilder: (BuildContext context, int index) {
                            return CustomCard(product: product[index]);
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          FooterScreen(currentIndex: 0),
        ],
      ),
    );
  }
}
