import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_listing/core/config/config.dart';
import 'package:product_listing/feature/product/data/data_sources/remote/product_remote_source.dart';
import 'package:product_listing/feature/product/domain/model/model.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class RequestOptionsMock extends Mock implements RequestOptions {}

void main() async {
  await AppConfig.instance.initialize();
  final Dio dio = Dio();
  late ProductRemoteSource remoteDataSource;
  late DioAdapterMock dioAdapterMock;

  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    remoteDataSource = ProductRemoteSource(
      httpClient: dio,
    );
    registerFallbackValue(RequestOptionsMock());
  });

  group('ProductRemoteSource', () {
    group('getProducts', () {
      const skip = 0;
      test('returns list of products on success response', () async {
        final responseJson =
            File('assets/json/products_mock_data.json').readAsStringSync();
        final httpResponse = ResponseBody.fromString(
          responseJson,
          HttpStatus.ok,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );

        when(() => dioAdapterMock.fetch(any(), any(), any()))
            .thenAnswer((_) async => httpResponse);
        final response = await remoteDataSource.getProducts(skip);
        expect(response, isA<List<Product>>());
        expect(response.length, 10);
      });

      test('throws exception on error response', () async {
        final errorJson = jsonEncode({'message': 'internal server error'});
        final httpResponse = ResponseBody.fromString(
          errorJson,
          HttpStatus.internalServerError,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );

        when(() => dioAdapterMock.fetch(any(), any(), any()))
            .thenAnswer((_) async => httpResponse);

        await expectLater(
          remoteDataSource.getProducts(skip),
          throwsA(
            isA<Exception>(),
          ),
        );
      });
    });

    group('getProductsById', () {
      const id = 1;

      test('returns a product on success response', () async {
        final responseJson =
            File('assets/json/products_mock_data.json').readAsStringSync();
        final decodedResponse = await json.decode(responseJson);
        final encodedResponse = json.encode(decodedResponse['products'][0]);
        final httpResponse = ResponseBody.fromString(
          encodedResponse,
          HttpStatus.ok,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
        when(() => dioAdapterMock.fetch(any(), any(), any()))
            .thenAnswer((_) async => httpResponse);
        final response = await remoteDataSource.getProductById(id);

        expect(response, isA<Product>());
      });
      test('throws exception on error response', () async {
        final errorJson = jsonEncode({'message': 'internal server error'});
        final httpResponse = ResponseBody.fromString(
          errorJson,
          HttpStatus.internalServerError,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );

        when(() => dioAdapterMock.fetch(any(), any(), any()))
            .thenAnswer((_) async => httpResponse);

        await expectLater(
          remoteDataSource.getProductById(id),
          throwsA(
            isA<Exception>(),
          ),
        );
      });
    });
  });
}
