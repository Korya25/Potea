import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:potea_app/core/constants/database_keys.dart';

class ProductModel {
  final String id;
  final String? title;
  final String? description;
  final double? price;
  final double? discount;
  final double? priceAfterDiscount;
  final List<String>? images;
  final String? mainImage;
  final int? stock;
  final int? sold;
  final double? rating;
  final int? ratingCount;
  final Timestamp createdAt;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.images,
    required this.mainImage,
    required this.stock,
    required this.sold,
    required this.rating,
    required this.ratingCount,
    required this.createdAt,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map, String documentId) {
    return ProductModel(
      id: documentId,
      title: map[DatabaseKeys.title],
      description: map[DatabaseKeys.description],
      price: (map[DatabaseKeys.price]).toDouble(),
      discount: (map[DatabaseKeys.discount]).toDouble(),
      priceAfterDiscount: (map[DatabaseKeys.priceAfterDiscount]).toDouble(),
      images: List<String>.from(map[DatabaseKeys.images]),
      mainImage: map[DatabaseKeys.mainImage],
      stock: map[DatabaseKeys.stock],
      sold: map[DatabaseKeys.sold],
      rating: (map[DatabaseKeys.rating]).toDouble(),
      ratingCount: map[DatabaseKeys.ratingCount],
      createdAt: map[DatabaseKeys.createdAt],
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[DatabaseKeys.id],
      title: json[DatabaseKeys.title],
      description: json[DatabaseKeys.description],
      price: (json[DatabaseKeys.price]).toDouble(),
      discount: (json[DatabaseKeys.discount]).toDouble(),
      priceAfterDiscount: (json[DatabaseKeys.priceAfterDiscount]).toDouble(),
      images: List<String>.from(json[DatabaseKeys.images]),
      mainImage: json[DatabaseKeys.mainImage],
      stock: json[DatabaseKeys.stock],
      sold: json[DatabaseKeys.sold],
      rating: (json[DatabaseKeys.rating]).toDouble(),
      ratingCount: json[DatabaseKeys.ratingCount],
      createdAt: Timestamp.fromMillisecondsSinceEpoch(
        json[DatabaseKeys.createdAt],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DatabaseKeys.id: id,
      DatabaseKeys.title: title,
      DatabaseKeys.description: description,
      DatabaseKeys.price: price,
      DatabaseKeys.discount: discount,
      DatabaseKeys.priceAfterDiscount: priceAfterDiscount,
      DatabaseKeys.images: images,
      DatabaseKeys.mainImage: mainImage,
      DatabaseKeys.stock: stock,
      DatabaseKeys.sold: sold,
      DatabaseKeys.rating: rating,
      DatabaseKeys.ratingCount: ratingCount,
      DatabaseKeys.createdAt: createdAt.millisecondsSinceEpoch,
    };
  }
}
