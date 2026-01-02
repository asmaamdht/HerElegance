import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_elegance/cubits/get_wish_list_cubit/get_wish_list_state.dart';
import 'package:her_elegance/models/product_model.dart';

class WishListCubit extends Cubit<WishListStates> {
  WishListCubit() : super(InitialWishListState());

  List<ProductModel> wishlistItems = [];

  void toggleWishlist(ProductModel product) {
    if (wishlistItems.any((p) => p.id == product.id)) {
      wishlistItems.removeWhere((p) => p.id == product.id);
    } else {
      wishlistItems.add(product);
    }
    emit(WishlistUpdated(List.from(wishlistItems)));
  }
}
