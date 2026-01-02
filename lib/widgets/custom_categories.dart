import 'package:flutter/material.dart';
import 'package:her_elegance/widgets/custom_card_category.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({super.key, required this.onCategoryTap});
  final Function(String url) onCategoryTap;

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'text': '💍',
        'url': 'https://dummyjson.com/products/category/womens-jewellery',
      },
      {
        'text': '👜',
        'url': 'https://dummyjson.com/products/category/womens-bags',
      },
      {
        'text': '👗',
        'url': 'https://dummyjson.com/products/category/womens-dresses',
      },
      {
        'text': '👡',
        'url': 'https://dummyjson.com/products/category/womens-shoes',
      },
      {
        'text': '⌚️',
        'url': 'https://dummyjson.com/products/category/womens-watches',
      },
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories.map((ele) {
        return CardCategory(
          text: ele['text']!,
          onTap: () => onCategoryTap(ele['url']!),
        );
      }).toList(),
    );
  }
}
