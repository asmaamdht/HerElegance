import 'package:her_elegance/models/product_model.dart';

class CartStates {}

class InitialCartState extends CartStates {}

class CartUpdated extends CartStates {
  final List<ProductModel> productModel;
  CartUpdated(this.productModel);
}
