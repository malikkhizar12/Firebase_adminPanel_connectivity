import 'package:best_foot_wears/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/drop_down_button.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController offerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 15,),
                Center(
                  child: Text('Add New Product', style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown
                  ),),
                ),
                SizedBox(height: 15,),

                Container(
                  child: TextField(
                    controller: productNameController,
                    style: TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        fontSize: 18
                    ),
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric( horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'Product Name',
                        hintText: 'Enter Product Name'


                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: TextField(
                    controller: productDescriptionController,
                    style: TextStyle(
                        fontSize: 18
                    ),
                    maxLines: 8,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric( horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'Product Description',
                        hintText: 'Enter product description'
                    ),
                  ),
                ),
                SizedBox(height: 15,),

                Container(
                  child: TextField(
                    controller: imageUrlController,
                    style: TextStyle(
                        fontSize: 18
                    ),
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric( horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'Image URL',
                        hintText: 'Enter image Url'


                    ),
                  ),
                ),
                SizedBox(height: 15,),

                Container(
                  child: TextField(
                    controller: priceController,
                    style: TextStyle(
                        fontSize: 18
                    ),
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric( horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'Price',
                        hintText: 'Enter Product price'


                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Flexible(child: DropDownBtn(
                      items: ['Runner shoes', 'sandles', 'Formals'],
                      selectedItemtext: 'Category',
                      onSelected: (selectedValue) {
                        ctrl.selectedCategory = selectedValue as RxString; // Assuming you have a variable in HomeController to hold the selected bran
                      },
                    )
                    ),

                    Flexible(
                        child: DropDownBtn(items: ['Puma', 'Nike', 'Adidas'],
                          selectedItemtext: 'Brand',
                          onSelected: (selectedValue) {
                            ctrl.selectedBrand = selectedValue as RxString; // Assuming you have a variable in HomeController to hold the selected brand
                          },
                        )
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Text('Offers?'),
                SizedBox(height: 10,),
                DropDownBtn(items: ['true', 'false'],
                  selectedItemtext: 'Offers?',
                  onSelected: (selectedValue) {},
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ctrl.addProduct(
                        productName: productNameController.text,
                        productDescription: productDescriptionController.text,
                        imageUrl: imageUrlController.text,
                        price: priceController.text,
                        category: ctrl.selectedCategory.value, // Use the selected category from HomeController
                        brand: ctrl.selectedBrand.value, // Use the selected brand from HomeController
                        hasOffers: offerController.text == 'true', // Assuming offerController.text is 'true' or 'false'
                      );
                    },
                    child: Text(
                      "Add Product",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.withOpacity(0.5),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    });
  }
}
