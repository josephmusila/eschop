import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/productsModel.dart';
import 'package:shop/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
/*
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);
*/

  @override
  Widget build(BuildContext context) {
    final product= Provider.of<Product>(context,listen: false);
    final cart=Provider.of<Cart>(context,listen: false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          elevation: 6,
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                    arguments: product.id);
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: IconButton(
                  color: Theme.of(context).accentColor,
                  icon:  Consumer<Product>(
                    builder: (BuildContext context, product, child) => Icon(product.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border)),
                  onPressed: () {
                    product.toggleFavouriteStatus();
                  },
                ),


                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    cart.addItem(product.id, product.title, product.price);
                    Scaffold.of(context).hideCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(SnackBar(
                        //duration: Duration(seconds: 1),
                        action: SnackBarAction(
                          label: "Undo",
                          onPressed: (){
                            cart.removeSingleItem(product.id);
                          },
                        ),
                        content: Text("Added item to cart")
                    ));
                  },
                ),
          ),
        ),
      ),
    );
  }
}
