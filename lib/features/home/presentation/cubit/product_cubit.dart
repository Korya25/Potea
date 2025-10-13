import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potea_app/core/errors/failure.dart';
import 'package:potea_app/features/home/data/repo/product_repository.dart';
import 'package:potea_app/features/home/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial());

  void getProducts() async {
    emit(ProductLoading());
    await for (final result in repository.getProducts()) {
      result.fold(
        (failure) => emit(ProductError(_mapFailureToMessage(failure))),
        (products) => emit(ProductLoaded(products: products)),
      );
    }
  }

  void getProductById(String id) async {
    emit(ProductLoading());
    await for (final result in repository.getProductById(id)) {
      result.fold(
        (failure) => emit(ProductError(_mapFailureToMessage(failure))),
        (product) => emit(SingleProductLoaded(product: product)),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.message;
  }
}
