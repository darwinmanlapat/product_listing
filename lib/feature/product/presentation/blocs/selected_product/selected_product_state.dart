part of 'selected_product_bloc.dart';

class SelectedProductState extends Equatable {
  const SelectedProductState({
    this.status = Status.initial,
    Product? product,
  }) : product = product ?? const Product.initial();

  final Product product;
  final Status status;

  SelectedProductState copyWith({
    Product? product,
    Status? status,
    bool? hasReachedMax,
  }) {
    return SelectedProductState(
      product: product ?? this.product,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return '''SelectedProductState { status: $status, product: $product }''';
  }

  @override
  List<Object?> get props => [status, product];
}
