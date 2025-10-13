import 'package:dartz/dartz.dart';
import 'package:potea_app/core/constants/error_messages.dart';
import 'package:potea_app/core/errors/failure.dart';
import 'package:potea_app/core/models/product_model.dart';
import 'package:potea_app/core/services/network/network_services.dart';
import 'package:potea_app/features/home/data/datasource/product_remote_data_source.dart';

class ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final NetworkService networkService;

  ProductRepository({
    required this.remoteDataSource,
    required this.networkService,
  });

  Stream<Either<Failure, List<ProductModel>>> getProducts() async* {
    final isConnected = await networkService.isConnected();

    if (!isConnected) {
      yield Left(ServerFailure(ErrorMessages.noInternet));
      return;
    }

    try {
      await for (final products in remoteDataSource.fetchProducts()) {
        yield Right(products);
      }
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }

  Stream<Either<Failure, ProductModel>> getProductById(String id) async* {
    final isConnected = await networkService.isConnected();

    if (!isConnected) {
      yield Left(ServerFailure(ErrorMessages.noInternet));
      return;
    }

    try {
      await for (final product in remoteDataSource.fetchProductById(id)) {
        yield Right(product);
      }
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }
}
