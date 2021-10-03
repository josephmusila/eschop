import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/productsModel.dart';
import 'package:shop/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  //final String title;
  static const routeName = "/products_details";

  ProductDetailScreen();

  @override
  Widget build(BuildContext context) {
    final Productid = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<ProvideProducts>(context, listen: false)
        .findById(Productid);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 30,
              child: Center(
                child: Text("Ksh ${loadedProduct.price}",

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            Card(

              elevation: 5,
              child: Center(

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Text(loadedProduct.description,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    
                  ),
              ),
                ),

              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text("Other Related Items",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900
                ),),
              ),
            ),
            Container(
              height: 5,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
