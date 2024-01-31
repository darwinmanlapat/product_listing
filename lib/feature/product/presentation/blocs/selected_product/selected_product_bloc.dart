import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_listing/core/enum/enum.dart';
import 'package:product_listing/feature/product/domain/model/model.dart';
import 'package:product_listing/feature/product/domain/repository/repository.dart';

part 'selected_product_event.dart';
part 'selected_product_state.dart';

class SelectedProductBloc extends Bloc<SelectedProductEvent, SelectedProductState> {
  SelectedProductBloc({required this.repository}) : super(const SelectedProductState()) {
    on<GetProductById>(_onGetProductById);
  }

  final ProductRepository repository;
  
  Future<void> _onGetProductById(
      GetProductById event, Emitter<SelectedProductState> emit) async {
    try {
      emit(state.copyWith(status: Status.initial));
      final id = event.id;
      final product = await repository.getProductById(id);

      emit(state.copyWith(status: Status.success, product: product));
    } catch (_) {
      emit(state.copyWith(status: Status.error));
    }
  }
}