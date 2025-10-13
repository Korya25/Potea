import 'package:dartz/dartz.dart';
import 'package:potea_app/core/errors/failure.dart';
import 'package:potea_app/core/models/product_model.dart';
import 'package:potea_app/features/home/data/datasource/product_remote_data_source.dart';

class ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepository({required this.remoteDataSource});

  Stream<Either<Failure, List<ProductModel>>> getProducts() async* {
    try {
      await for (final products in remoteDataSource.fetchProducts()) {
        yield Right(products);
      }
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }

  Stream<Either<Failure, ProductModel>> getProductById(String id) async* {
    try {
      await for (final product in remoteDataSource.fetchProductById(id)) {
        yield Right(product);
      }
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }
}
