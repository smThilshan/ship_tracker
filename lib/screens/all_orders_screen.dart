import 'package:flutter/material.dart';
import 'package:ship_tracker/widgets/order_card_widget.dart';

class AllOrdersScreen extends StatefulWidget {
  static const routeName = 'all_order_screen';
  const AllOrdersScreen({super.key});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  // Simulated list of orders
  final List<Map<String, String>> orders = [
    {'orderNumber': '848484777', 'status': 'Delivered'},
    {'orderNumber': '848484778', 'status': 'Cancelled'},
    {'orderNumber': '848484779', 'status': 'Confirmed'},
    {'orderNumber': '848484780', 'status': 'Pending'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: OrderCardWidget(
              orderNumber: orders[index]['orderNumber']!,
              status: orders[index]['status']!,
            ),
          );
        },
      ),
    );
  }
}
