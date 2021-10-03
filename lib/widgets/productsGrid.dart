import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/productsModel.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_item.dart';
class ProductsGrid extends StatelessWidget {
 final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final ProductsData=Provider.of<ProvideProducts>(context);
    final products=showFavs?ProductsData.favoriteItems:ProductsData.items;
    return GridView.builder(
      padding:const  EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder:(ctxt,index)=>
         ChangeNotifierProvider(
          create: (c)=>products[index],
          child: ProductItem(
            /*products[index].id,
            products[index].title,
            products[index].imageUrl,*/
          ),
        )

    );
  }
}
