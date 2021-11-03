import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/providers/productsModel.dart';
import 'package:shop/widgets/drawer.dart';
import 'package:shop/widgets/user_product_item.dart';

import 'edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);
  static const routeName="/user-products";

  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<ProvideProducts>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("your products"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          }, icon: Icon(Icons.add))
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
            itemBuilder: (_,index){
                return Column(
                  children: [
                    UserProductItem(
                      productsData.items[index].id,



                      
                      productsData.items[index].title,
                      productsData.items[index].imageUrl
                    ),
                    Divider(),
                  ],
                );
            }
        ),
      ),
    );
  }
}
