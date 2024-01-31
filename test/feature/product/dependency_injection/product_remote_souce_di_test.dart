import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_listing/feature/product/data/data_sources/remote/remote.dart';

class MockHttpClient extends Mock implements Dio {}

class MockProductRemoteSource extends Mock implements ProductRemoteSource {
  MockProductRemoteSource({
    required Dio httpClient,
  });
}

void main() {
  late ProductRemoteSource remoteSource;
  late Dio httpClient;

  setUp(() {
    httpClient = MockHttpClient();
    remoteSource = MockProductRemoteSource(httpClient: httpClient);
  });

  group('Product Remote Source Dependency Injection', () {
    test('returns correct value', () {
      expect(remoteSource, isA<ProductRemoteSource>());
    });
  });
}
