import 'package:flowerss/model/product_model.dart';

class CartManager {
  static List<ProductModel> cartItems = [];

  static void addToCart(ProductModel product) {
    cartItems.add(product);
  }

  static void removeFromCart(ProductModel product) {
    cartItems.remove(product);
  }

  static bool isInCart(ProductModel product) {
    return cartItems.contains(product);
  }

  static double getTotalPrice() {
    double total = 0;
    for (var product in cartItems) {
      total += product.price; 
    }
    return total;
  }
}
