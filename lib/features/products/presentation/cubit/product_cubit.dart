import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/product_repository.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(const ProductState());

  Future<void> fetchProducts() async {
    if (state.status == ProductStatus.loading) return;

    emit(
      state.copyWith(status: ProductStatus.loading, clearErrorMessage: true),
    );

    try {
      final products = await repository.getProducts();

      emit(
        state.copyWith(
          status: ProductStatus.success,
          products: products,
          totalCount: products.length,
          clearErrorMessage: true,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ProductStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
