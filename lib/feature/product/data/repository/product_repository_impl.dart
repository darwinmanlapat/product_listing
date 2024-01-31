import 'package:product_listing/feature/product/data/data_sources/remote/remote.dart';
import 'package:product_listing/feature/product/domain/model/model.dart';
import 'package:product_listing/feature/product/domain/repository/repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl({
    required ProductRemoteSource remoteSource,
  }) : _remoteSource = remoteSource;

  final ProductRemoteSource _remoteSource;

  @override
  Future<List<Product>> getProducts([int startIndex = 0]) async {
    final products = await _remoteSource.getProducts(startIndex);
    return products;
  }

  @override
  Future<Product> getProductById(int id) async {
    final product = await _remoteSource.getProductById(id);
    return product;
  }
}
