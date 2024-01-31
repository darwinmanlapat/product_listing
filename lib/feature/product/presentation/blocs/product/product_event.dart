part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProducts extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class GetProductsException extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class ProductSelect extends ProductEvent {
  ProductSelect(this.isProductSelected);

  final bool isProductSelected;

  @override
  List<Object?> get props => [isProductSelected];
}
