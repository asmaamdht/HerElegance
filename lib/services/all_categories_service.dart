import 'package:her_elegance/helpers/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(
      url: 'https://dummyjson.com/products/categories',
    );

    return data;
  }
}
