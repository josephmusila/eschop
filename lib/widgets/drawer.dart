import 'package:flutter/material.dart';
import 'package:shop/screens/user_products_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Quick Menu"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Shop"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed("/");
            },

          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit ),
            title: Text("Manage Products"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            },

          )
        ],
      ),
    );
  }
}
