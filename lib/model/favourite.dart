import 'package:flowerss/model/product_model.dart';

class FavoriteManager {
  static List<ProductModel> favorites = [];

  static void addFavorite(ProductModel product) {
    favorites.add(product); // ✅ كده صح
  }

  static void removeFavorite(ProductModel product) {
    favorites.remove(product);
  }

  static bool isFavorite(ProductModel product) {
    return favorites.contains(product);
  }
}
