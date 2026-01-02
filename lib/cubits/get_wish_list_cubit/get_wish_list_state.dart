import 'package:her_elegance/models/product_model.dart';

class WishListStates {}

class InitialWishListState extends WishListStates {}

class WishlistUpdated extends WishListStates {
  final List<ProductModel> wishlistItems;
  WishlistUpdated(this.wishlistItems);
}
