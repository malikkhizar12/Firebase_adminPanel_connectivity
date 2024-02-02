import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  RxString selectedCategory = ''.obs;
  RxString selectedBrand = ''.obs;
  @override
  void onInit() {
    productCollection = fireStore.collection('products');
    super.onInit();
  }

  Future<void> addProduct({
    required String productName,
    required String productDescription,
    required String imageUrl,
    required String price,
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
}
