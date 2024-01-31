part of 'product_bloc.dart';

@immutable
class ProductState extends Equatable {
  const ProductState({
    this.status = Status.initial,
    List<Product>? products,
    this.hasReachedMax = false,
    this.isProductSelected = false,
  }) : products = products ?? const [];

  final List<Product> products;
  final Status status;
  final bool hasReachedMax;
  final bool isProductSelected;

  ProductState copyWith(
      {List<Product>? products,
      Status? status,
      bool? hasReachedMax,
      bool? isProductSelected}) {
    return ProductState(
      products: products ?? this.products,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isProductSelected: isProductSelected ?? this.isProductSelected,
    );
  }

  @override
  String toString() {
    return '''ProductState { status: $status, hasReachedMax: $hasReachedMax, products: ${products.length}, isProductSelected: $isProductSelected}''';
  }

  @override
  List<Object?> get props =>
      [status, products.length, hasReachedMax, isProductSelected];
}
