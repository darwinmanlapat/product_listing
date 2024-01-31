import 'dart:convert';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_listing/core/enum/enum.dart';
import 'package:product_listing/feature/product/domain/model/model.dart';
import 'package:product_listing/feature/product/domain/repository/repository.dart';
import 'package:product_listing/feature/product/presentation/blocs/selected_product/selected_product_bloc.dart';
import 'package:test/test.dart';

late final List<Product> mockProducts;

Future<void> readJson() async {
  final response =
      File('assets/json/products_mock_data.json').readAsStringSync();
  final decodedResponse = await json.decode(response);
  final data = (decodedResponse['products'] as List<dynamic>)
      .cast<Map<String, dynamic>>();
  mockProducts = data
      .map(
        (item) => Product.fromJson(item),
      )
      .toList();
}

Product mockFindProduct(int id) =>
    mockProducts.firstWhere((product) => product.id == id);

class MockProductRepository extends Mock implements ProductRepository {
  @override
  Future<Product> getProductById(int id) async {
    return await Future.value(mockFindProduct(id));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await readJson();
  group('SelectedProductBloc', () {
    late SelectedProductBloc bloc;
    late ProductRepository repository;

    setUp(() {
      repository = MockProductRepository();
      bloc = SelectedProductBloc(repository: repository);
    });

    test('initial state is SelectedProductState()', () {
      expect(bloc.state, const SelectedProductState());
    });

    group('GetProductById Event', () {
      blocTest<SelectedProductBloc, SelectedProductState>(
        'Product should be fetch',
        build: () => bloc,
        act: (bloc) => bloc.add(GetProductById(id: 5)),
        expect: () => [
          const SelectedProductState(),
          SelectedProductState(
            status: Status.success,
            product: mockFindProduct(5),
          )
        ],
      );

      blocTest<SelectedProductBloc, SelectedProductState>(
        'Product data should not be null',
        build: () => bloc,
        act: (bloc) => bloc.add(GetProductById(id: 1)),
        expect: () => [
          const SelectedProductState(),
          SelectedProductState(
            status: Status.success,
            product: Product(
              id: mockProducts[0].id,
              title: mockProducts[0].title,
              description: mockProducts[0].description,
              price: mockProducts[0].price,
              discountPercentage: mockProducts[0].discountPercentage,
              rating: mockProducts[0].rating,
              stock: mockProducts[0].stock,
              brand: mockProducts[0].brand,
              category: mockProducts[0].category,
              thumbnail: mockProducts[0].thumbnail,
              images: mockProducts[0].images,
            ),
          )
        ],
      );

      blocTest<SelectedProductBloc, SelectedProductState>(
        'state should be Status.error when encountered an error',
        build: () => bloc,
        act: (bloc) {
          bloc.on<GetProductByIdException>(
              (event, emit) => emit(const SelectedProductState(
                    status: Status.error,
                  )));
          bloc.add(GetProductByIdException());
        },
        expect: () => [
          const SelectedProductState(
            status: Status.error,
          )
        ],
      );
    });

    tearDown(() {
      bloc.close();
    });
  });
}
