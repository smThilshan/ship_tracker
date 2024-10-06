import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import '../models/order_model.dart';

class OrderProvider extends ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }
}
