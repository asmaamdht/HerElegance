import 'package:her_elegance/helpers/api.dart';
import 'package:her_elegance/models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getProductsByCategory(String url) async {
    Map<String, dynamic> data = await Api().get(url: url);

    List<dynamic> products = data['products'];
    return products.map((ele) => ProductModel.fromJson(ele)).toList();
  }
}
