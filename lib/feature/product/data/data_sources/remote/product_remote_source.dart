import 'package:dio/dio.dart';
import 'package:product_listing/core/config/config.dart';
import 'package:product_listing/feature/product/domain/model/model.dart';

class ProductRemoteSource {
  const ProductRemoteSource({
    required Dio httpClient,
  }) : _httpClient = httpClient;

  final Dio _httpClient;

  Future<List<Product>> getProducts(int startIndex) async {
    try {
      final response = await _httpClient.get(
        '${AppConfig.instance.restEndpoint}/products',
        queryParameters: {
          'skip': startIndex,
          'limit': 10,
        },
      );

      if (response.statusCode == 200) {
        final data = (response.data['products'] as List<dynamic>)
            .cast<Map<String, dynamic>>();
        final products = data
            .map(
              (item) => Product.fromJson(item),
            )
            .toList();

        return products;
      }

      throw Exception('Unable to fetch products');
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      final response = await _httpClient.get(
        '${AppConfig.instance.restEndpoint}/products/$id',
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final product = Product.fromJson(data);
        return product;
      }

      throw Exception('Unable to fetch product with an id of $id');
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
