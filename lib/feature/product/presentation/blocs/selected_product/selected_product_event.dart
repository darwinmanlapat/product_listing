part of 'selected_product_bloc.dart';

abstract class SelectedProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProductById extends SelectedProductEvent {
  GetProductById({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}

class GetProductByIdException extends SelectedProductEvent {
  @override
  List<Object?> get props => [];
}