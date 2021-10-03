import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/product_detail_screen.dart';
import '../screens/products_overView_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ProvideProducts provideProducts;

  @override
  void initState() {
    provideProducts = ProvideProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
    create: (context)=>ProvideProducts(),),
      ChangeNotifierProvider(
      create:(context)=> Cart(),),


    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.deepOrange,
            fontFamily: "Lato"),
        home: ProductsOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName:(context)=>CartScreen(),
        },
      ),

    );
  }
}
