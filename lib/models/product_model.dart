import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  late String id;
  late String productName;
  late String productDescription;
  late String imageUrl;
  late int price;
  late String category;
  late String brand;
  late bool hasOffers;

  ProductModel({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.brand,
    required this.hasOffers,
  });

  factory ProductModel.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      id: doc.id,
      productName: data['productName'] ?? '',
      productDescription: data['productDescription'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      price: data['price'] ?? 0,  // Cast the value to an int, or provide a default value
      category: data['category'] ?? '',
      brand: data['brand'] ?? '',
      hasOffers: data['hasOffers'] ?? false,
    );
  }

}
