import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:product_listing/core/enum/enum.dart';
import 'package:product_listing/feature/product/domain/model/model.dart';
import 'package:product_listing/feature/product/domain/repository/repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.repository}) : super(const ProductState()) {
    on<GetProducts>(_onGetProducts, transformer: sequential());
    on<ProductSelect>(_onProductSelect);
  }

  final ProductRepository repository;

  void _onProductSelect(ProductSelect event, Emitter<ProductState> emit) {
    emit(
      state.copyWith(
        isProductSelected: event.isProductSelected,
      ),
    );
  }

  Future<void> _onGetProducts(
      GetProducts event, Emitter<ProductState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == Status.initial) {
        final products = await repository.getProducts();
        return emit(
          state.copyWith(
            status: Status.success,
            products: products,
            hasReachedMax: false,
          ),
        );
      }
      final products = await repository.getProducts(state.products.length);

      products.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: Status.success,
                products: List.of(state.products)..addAll(products),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: Status.error));
    }
  }
}
