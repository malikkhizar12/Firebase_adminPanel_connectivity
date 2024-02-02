import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class HomeController extends GetxController {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  RxString selectedCategory = ''.obs;
  RxString selectedBrand = ''.obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  @override
  void onInit() {
    productCollection = fireStore.collection('products');
    fetchProducts();
    super.onInit();
  }

  Future<void> addProduct({
    required String productName,
    required String productDescription,
    required String imageUrl,
    required int price,
    required String category,
    required String brand,
    required bool hasOffers,
  }) async {
    try {
      await productCollection.add({
        'productName': productName,
        'productDescription': productDescription,
        'imageUrl': imageUrl,
        'price': price,
        'category': category,
        'brand': brand,
        'hasOffers': hasOffers,
      });

      print('Product added to Firestore successfully!');
    } catch (e) {
      print('Error adding product to Firestore: $e');
      // You might want to throw an exception here or handle it as needed
    }
  }
  Future<void> fetchProducts() async {
    try {
      QuerySnapshot productSnap = await productCollection.get();

      products.value = productSnap.docs
          .map((doc) => ProductModel.fromFirestore(doc as QueryDocumentSnapshot<Map<String, dynamic>>))
          .toList();
    } catch (e) {
      print('Error fetching products: $e');
      // Handle error as needed
    }
  }

}
