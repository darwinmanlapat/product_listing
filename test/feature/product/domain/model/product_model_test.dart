import 'package:flutter_test/flutter_test.dart';
import 'package:product_listing/feature/product/domain/model/product_model.dart';

void main() {
  group('ProductModel', () {
    group('fromJson', () {
      test('returns correct model', () {
        const model = Product(
          id: 1,
          title: 'iPhone 9',
          description: 'An apple mobile which is nothing like apple',
          price: 549,
          discountPercentage: 12.96,
          rating: 4.69,
          stock: 94,
          brand: 'Apple',
          category: 'smartphones',
          thumbnail: 'https://i.dummyjson.com/data/products/1/thumbnail.jpg',
          images: [
            'https://i.dummyjson.com/data/products/1/1.jpg',
            'https://i.dummyjson.com/data/products/1/2.jpg',
            'https://i.dummyjson.com/data/products/1/3.jpg',
            'https://i.dummyjson.com/data/products/1/4.jpg',
            'https://i.dummyjson.com/data/products/1/thumbnail.jpg'
          ],
        );

        expect(
          Product.fromJson(
            const {
              'id': 1,
              'title': 'iPhone 9',
              'description': 'An apple mobile which is nothing like apple',
              'price': 549,
              'discountPercentage': 12.96,
              'rating': 4.69,
              'stock': 94,
              'brand': 'Apple',
              'category': 'smartphones',
              'thumbnail':
                  'https://i.dummyjson.com/data/products/1/thumbnail.jpg',
              'images': [
                'https://i.dummyjson.com/data/products/1/1.jpg',
                'https://i.dummyjson.com/data/products/1/2.jpg',
                'https://i.dummyjson.com/data/products/1/3.jpg',
                'https://i.dummyjson.com/data/products/1/4.jpg',
                'https://i.dummyjson.com/data/products/1/thumbnail.jpg'
              ]
            },
          ),
          model,
        );
      });
    });
  });
}
