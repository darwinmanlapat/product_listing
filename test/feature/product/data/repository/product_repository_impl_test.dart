import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_listing/feature/product/data/data_sources/remote/remote.dart';
import 'package:product_listing/feature/product/data/repository/repository.dart';
import 'package:product_listing/feature/product/domain/model/model.dart';

class MockProductRemoteSource extends Mock implements ProductRemoteSource {}

void main() {
  late MockProductRemoteSource remoteSource;
  late ProductRepositoryImpl repository;

  setUp(() {
    remoteSource = MockProductRemoteSource();
    repository = ProductRepositoryImpl(remoteSource: remoteSource);
  });

  group('ProductRepositoryImpl', () {
    group('getProducts', () {
      test('calls RemoteSource.getProducts', () async {
        when(
          () => remoteSource.getProducts(10),
        ).thenAnswer(
            (_) async => List.generate(10, (index) => Product(id: index)));

        await repository.getProducts(10);

        verify(
          () => remoteSource.getProducts(10),
        ).called(1);
      });
    });

    group('getProductById', () {
      test('calls RemoteSource.getProductById', () async {
        when(
          () => remoteSource.getProductById(1),
        ).thenAnswer((_) async => const Product());

        await repository.getProductById(1);

        verify(
          () => remoteSource.getProductById(1),
        ).called(1);
      });
    });
  });
}
