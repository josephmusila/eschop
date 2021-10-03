import 'package:flutter/foundation.dart';
import 'package:shop/widgets/wcartItem.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<WcartItem> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrders(List<WcartItem> cartProducts,double total){
      //_orders.insert(0, OrderItem(id: DateTime.now().toString(), amount: amount, products: products, dateTime: dateTime))
  }
}
