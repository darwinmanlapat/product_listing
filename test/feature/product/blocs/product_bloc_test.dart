import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_listing/core/enum/enum.dart';
import 'package:product_listing/feature/product/domain/model/model.dart';
import 'package:product_listing/feature/product/domain/repository/repository.dart';
import 'package:product_listing/feature/product/presentation/blocs/product/product_bloc.dart';
import 'package:test/test.dart';

List<Product> mockedProducts({int? limit}) =>
    List.generate(limit ?? 10, (index) => Product(id: index));

bool mockedHasReachedMax({required int total, required int skip}) =>
    skip >= total;

const totalProducts = 100;
const eventCount = 10;

class MockProductRepository extends Mock implements ProductRepository {
  @override
  Future<List<Product>> getProducts([int? startIndex]) async {
    final skip = startIndex ?? 0;
    final hasReachMax = mockedHasReachedMax(total: totalProducts, skip: skip);

    return await Future.value(hasReachMax ? [] : mockedProducts());
  }
}

void main() async {
  group('ProductBloc', () {
    late ProductBloc bloc;
    late ProductRepository repository;

    setUp(() {
      repository = MockProductRepository();
      bloc = ProductBloc(repository: repository);
    });

    test('initial state is ProductState()', () {
      expect(bloc.state, const ProductState());
    });

    group('GetProducts Event', () {
      blocTest<ProductBloc, ProductState>(
        'Products fetched should be limited to 10 per event',
        build: () => bloc,
        act: (bloc) {
          for (var i = 0; i < eventCount; i++) {
            bloc.add(GetProducts());
          }
        },
        expect: () => List.generate(
          eventCount,
          (index) => ProductState(
            status: Status.success,
            products: mockedProducts(limit: (index + 1) * eventCount),
            hasReachedMax: mockedHasReachedMax(
                total: totalProducts, skip: index * eventCount),
          ),
        ),
      );

      blocTest<ProductBloc, ProductState>(
        'hasReachedMax property should be true when the total limit of the list is reached',
        build: () => bloc,
        act: (bloc) {
          for (var i = 0; i <= eventCount; i++) {
            bloc.add(GetProducts());
          }
        },
        expect: () => [
          ProductState(
            status: Status.success,
            products: mockedProducts(limit: 100),
            hasReachedMax: true,
          ),
        ],
        skip: eventCount,
      );

      blocTest<ProductBloc, ProductState>(
        'state should be Status.error when encountered an error',
        build: () => bloc,
        act: (bloc) {
          bloc.on<GetProductsException>(
              (event, emit) => emit(const ProductState(
                    status: Status.error,
                  )));
          bloc.add(GetProductsException());
        },
        expect: () => [
          const ProductState(
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
