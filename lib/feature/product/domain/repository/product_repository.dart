import 'package:product_listing/feature/product/domain/model/model.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts([int startIndex]);

  Future<Product> getProductById(int id);
}
