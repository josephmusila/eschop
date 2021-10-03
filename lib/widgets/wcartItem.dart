import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

class WcartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  WcartItem(this.id, this.productId,this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(color: Theme.of(context).accentColor,
      child: Icon(Icons.delete,
      size: 40,
      color: Colors.white,
      ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4) ,
      ),
      direction:DismissDirection.endToStart,
      onDismissed: (direction){
        Provider.of<Cart>(context,listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: FittedBox(
              child: Container(
                height: 50,
                width: 70,
                color: Colors.deepOrange,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(child: Text("\Ksh ${price}",style: TextStyle(
                    color:Colors.white,
                  ),)),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text("Total: \$ ${(price * quantity)}"),
            trailing: Text("${quantity} X"),
          ),
        ),
      ),
    );
  }
}
