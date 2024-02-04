import 'package:best_foot_wears/Screens/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../models/product_model.dart';
class HomePage extends GetView<HomeController>{
   const HomePage({super.key});
   @override
  Widget build(BuildContext context) {
controller.fetchProducts();
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              controller.products.refresh();
              controller.update();
              Get.toNamed("/");
            }, icon: const Icon(Icons.refresh_outlined))
          ],
          title: const Center(child: Text('Best Foot Wears')),
        ),
        body: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            ProductModel product = controller.products[index];
            return ListTile(
              title: Text(product.productName),
              subtitle: Text('₨${product.price.toString()}'), // Display the price in PKR
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // Implement delete functionality if needed
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Get.to(AddProduct());
            controller.fetchProducts(); // Fetch products when returning from AddProduct
          },
        ),
      );
    }
}
