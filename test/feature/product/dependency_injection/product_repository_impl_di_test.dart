import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_listing/feature/product/data/data_sources/remote/product_remote_source.dart';
import 'package:product_listing/feature/product/data/repository/repository.dart';

class MockProductRemoteSource extends Mock implements ProductRemoteSource {}

class MockProductRepositoryImpl extends Mock implements ProductRepositoryImpl {
  MockProductRepositoryImpl({
    required ProductRemoteSource remoteSource,
  });
}

void main() {
  late ProductRemoteSource remoteSource;
  late ProductRepositoryImpl repository;

  setUp(() {
    remoteSource = MockProductRemoteSource();
    repository = MockProductRepositoryImpl(remoteSource: remoteSource);
  });

  group('Product Repository Dependency Injection', () {
    test('returns correct value', () {
      expect(repository, isA<ProductRepositoryImpl>());
    });
  });
}
