import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_elegance/cubits/get_product_cubit/get_product_state.dart';
import 'package:her_elegance/models/product_model.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(InitialCartState());

  List<ProductModel> cartItems = [];

  void addToCart(ProductModel product) {
    final index = cartItems.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(product);
    }
    emit(CartUpdated(List.from(cartItems)));
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
    emit(CartUpdated(List.from(cartItems)));
  }

  void increaseQuantity(ProductModel product) {
    product.quantity++;
    emit(CartUpdated(List.from(cartItems)));
  }

  void decreaseQuantity(ProductModel product) {
    if (product.quantity > 1) {
      product.quantity--;
      emit(CartUpdated(List.from(cartItems)));
    }
  }
}
