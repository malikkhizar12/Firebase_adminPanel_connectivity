import 'package:best_foot_wears/Screens/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Center(child: Text('Best Foot Wears')),

      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index)
      {
        return ListTile(
          title: Text('Title'),
          subtitle: Text('Subtitle'),
          
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){},
          ),
        );
      }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(AddProduct());
        },
      ),
    );
  }
}
