import 'package:best_foot_wears/Screens/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../models/product_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});


  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(

        appBar: AppBar(
          title: Center(child: Text('Best Foot Wears')),

        ),
        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              ProductModel product = ctrl.products[index];
              return ListTile(
                title: Text(product.productName),
                subtitle: Text(product.productDescription),

                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(AddProduct());
          },
        ),
      );
    });
  }
}
