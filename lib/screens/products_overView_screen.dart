import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/widgets/badge.dart';

import 'package:shop/widgets/productsGrid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverViewScreen extends StatefulWidget {
  @override
  _ProductsOverViewScreenState createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {

  var showOnlyFavorites=false;

  @override
  Widget build(BuildContext context) {
    //final productsContainer =
        //Provider.of<ProvideProducts>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Karia Supermarket"),
        actions: [
          IconButton(icon:Icon(
            Icons.shopping_cart,color: Colors.blue,),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
          Consumer<Cart>(
            builder: (_,cart,ch)=> Badge(
              child: ch as Widget,
              value: cart.itemCount.toString(),
              color: Theme.of(context).accentColor,

            ),
            child: IconButton(icon:Icon(
                Icons.shopping_cart,color: Colors.blue,),
              onPressed: () { 
              Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),

          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  showOnlyFavorites=true;
                  // productsContainer.showFavouritesMyOnly();
                } else {
                  // productsContainer.showAll();
                  showOnlyFavorites=false;

                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text("Only favourites"),
                  value: FilterOptions.Favorites),
              PopupMenuItem(
                child: Text("Show  All"),
                value: FilterOptions.All,
              ),
            ],
          ),

        ],

      ),
      body: ProductsGrid(showOnlyFavorites),
    );
  }
}
