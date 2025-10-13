import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:potea_app/core/constants/database_keys.dart';
import 'package:potea_app/core/constants/error_messages.dart';
import 'package:potea_app/core/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Stream<List<ProductModel>> fetchProducts();
  Stream<ProductModel> fetchProductById(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final FirebaseFirestore firestore;

  ProductRemoteDataSourceImpl({required this.firestore});

  @override
  Stream<List<ProductModel>> fetchProducts() {
    return firestore
        .collection(DatabaseKeys.products)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ProductModel.fromMap(doc.data(), doc.id))
              .toList(),
        );
  }

  @override
  Stream<ProductModel> fetchProductById(String id) {
    return firestore.collection(DatabaseKeys.products).doc(id).snapshots().map((
      doc,
    ) {
      if (!doc.exists) throw Exception(ErrorMessages.productNotFound);
      return ProductModel.fromMap(doc.data()!, doc.id);
    });
  }
}
