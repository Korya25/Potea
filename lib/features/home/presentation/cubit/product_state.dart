import 'package:potea_app/core/models/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  ProductLoaded({required this.products});
}

class SingleProductLoaded extends ProductState {
  final ProductModel product;

  SingleProductLoaded({required this.product});
}

class ProductError extends ProductState {
  final String? message;

  ProductError(this.message);
}
