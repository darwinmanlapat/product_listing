import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String>? images;
  final int? price;
  final int? stock;
  final num? discountPercentage;
  final num? rating;

  const Product({
    this.id,
    this.title,
    this.description,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
    this.price,
    this.stock,
    this.discountPercentage,
    this.rating,
  });

  const Product.initial()
      : id = null,
        title = null,
        description = null,
        brand = null,
        category = null,
        thumbnail = null,
        images = null,
        price = null,
        stock = null,
        discountPercentage = null,
        rating = null;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        brand,
        category,
        thumbnail,
        images,
        price,
        stock,
        discountPercentage,
        rating,
      ];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      brand: json['brand'] as String,
      category: json['category'] as String,
      thumbnail: json['thumbnail'] as String,
      images: (json['images'] as List<dynamic>).cast<String>(),
      price: json['price'] as int,
      stock: json['stock'] as int,
      discountPercentage: json['discountPercentage'] as num,
      rating: json['rating'] as num,
    );
  }
}
