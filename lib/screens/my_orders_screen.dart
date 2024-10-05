import 'package:flutter/material.dart';
import 'package:ship_tracker/screens/all_orders_screen.dart';
import 'package:ship_tracker/widgets/card_container_widget.dart';
import 'package:ship_tracker/widgets/card_widget.dart';
import 'package:ship_tracker/widgets/drawer_widget.dart';

class MyOrdersScreen extends StatefulWidget {
  static const routeName = 'my_orders_screen';
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "My Orders",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CardContainerWidget(title: "", cards: [
              CardWidget(
                title: "All Orders",
                value: "3.1k",
                iconPath: "assets/icons/warehouse.png",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllOrdersScreen()),
                  );
                },
              ),
              CardWidget(
                  title: "Draft",
                  value: "3.1k",
                  iconPath: "assets/icons/draft.png"),
              CardWidget(
                  title: "Confirmed",
                  value: "234.1k",
                  iconPath: "assets/icons/confirm.png"),
              CardWidget(
                  title: "Cancelled",
                  value: "122.3k",
                  iconPath: "assets/icons/cancel.png"),
              CardWidget(
                  title: "Delivered",
                  value: "3.1k",
                  iconPath: "assets/icons/delivered.png"),
              CardWidget(
                  title: "Partially Delivered",
                  value: "3.1k",
                  iconPath: "assets/icons/partially-delivered.png"),
              CardWidget(
                  title: "Rescheduled",
                  value: "234.1k",
                  iconPath: "assets/icons/reschedule.png"),
              CardWidget(
                  title: "Failed To Deliver",
                  value: "122.3k",
                  iconPath: "assets/icons/failed-to-deliver.png"),
            ])
          ],
        ),
      ),
    );
  }
}
