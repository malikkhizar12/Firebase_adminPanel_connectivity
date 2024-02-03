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
          title: const Text('Add Product'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 15,),
                const Center(
                  child: Text('Add New Product', style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown
                  ),),
                ),
                const SizedBox(height: 15,),

                Container(
                  child: TextField(
                    controller: productNameController,
                    style: const TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        fontSize: 18
                    ),
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric( horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'Product Name',
                        hintText: 'Enter Product Name'


                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  child: TextField(
                    controller: productDescriptionController,
                    style: const TextStyle(
                        fontSize: 18
                    ),
                    maxLines: 8,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric( horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'Product Description',
                        hintText: 'Enter product description'
                    ),
                  ),
                ),
                const SizedBox(height: 15,),

                Container(
                  child: TextField(
                    controller: imageUrlController,
                    style: const TextStyle(
                        fontSize: 18
                    ),
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric( horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'Image URL',
                        hintText: 'Enter image Url'


                    ),
                  ),
                ),
                const SizedBox(height: 15,),

                Container(
                  child: TextField(
                    controller: priceController,
                    style: const TextStyle(
                        fontSize: 18
                    ),
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric( horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelText: 'Price',
                        hintText: 'Enter Product price'


                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    Flexible(child: DropDownBtn(
                      items: const ['Runner shoes', 'sandles', 'Formals'],
                      selectedItemtext: 'Category',
                      onSelected: (selectedValue) {
                        ctrl.selectedCategory = selectedValue as RxString; // Assuming you have a variable in HomeController to hold the selected bran
                      },
                    )
                    ),

                    Flexible(
                        child: DropDownBtn(items: const ['Puma', 'Nike', 'Adidas'],
                          selectedItemtext: 'Brand',
                          onSelected: (selectedValue) {
                            ctrl.selectedBrand = selectedValue as RxString; // Assuming you have a variable in HomeController to hold the selected brand
                          },
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                const Text('Offers?'),
                const SizedBox(height: 10,),
                DropDownBtn(items: const ['true', 'false'],
                  selectedItemtext: 'Offers?',
                  onSelected: (selectedValue) {},
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                      // Attempt to parse the text from priceController to an integer
                      int? price = int.tryParse(priceController.text);

                      // Check if parsing was successful
                      if (price != null) {
                        ctrl.addProduct(
                          productName: productNameController.text,
                          productDescription: productDescriptionController.text,
                          imageUrl: imageUrlController.text,
                          price: price,  // Use the parsed integer as the price
                          category: ctrl.selectedCategory.value,
                          brand: ctrl.selectedBrand.value,
                          hasOffers: offerController.text == 'true',
                        );


                      } else {
                        // Handle the case where parsing failed (text is not a valid integer)
                        print('Invalid price format');
                        // You might want to show an error message to the user or take appropriate action
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent.withOpacity(0.5),
                    ),

                    child: const Text(
                      "Add Product",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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
