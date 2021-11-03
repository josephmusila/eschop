import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/widgets/wcartItem.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName= "/cart";


  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("total",style: TextStyle(
                    fontSize: 20,
                  ),),
                  //SizedBox(width: 10,),
                  Spacer(),
                  Chip(label: Text("\$ ${product.totalAmount.toStringAsFixed(2)}",
                  style: TextStyle(
                    //color: Theme.of(context).primaryTextTheme.title.color,
                  ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(onPressed: (){
                   // Provider.of<Orders>(context,listen: false).addOrders(product.items.values.toList(), product.totalAmount);
                    product.clearCart();
                  }, 
                      child: Text("ORDER NOW")),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(child: ListView.builder(
            itemCount: product.items.length,
              itemBuilder: (context,index){
                return WcartItem(
                    product.items.values.toList()[index].id,
                    product.items.keys.toList()[index],
                    product.items.values.toList()[index].price,
                    product.items.values.toList()[index].quantity,
                    product.items.values.toList()[index].title);
              },
          ),)
        ],
      ),
    );
  }
}
