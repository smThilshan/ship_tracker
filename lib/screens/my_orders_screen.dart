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
        backgroundColor: Colors.white, // AppBar background color
        elevation: 0, // No shadow
        title: const Text(
          "My Orders", // Title of the screen
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications,
                color: Colors.black), // Notification icon
            onPressed: () {}, // Placeholder for notification action
          ),
        ],
        centerTitle: true, // Center the title
      ),
      drawer: const DrawerWidget(), // Navigation drawer
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          children: [
            CardContainerWidget(title: "", cards: [
              CardWidget(
                title: "All Orders", // Card title
                value: "3.1k", // Card value
                iconPath: "assets/icons/warehouse.png", // Card icon
                onPressed: () {
                  // Action when card is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AllOrdersScreen()), // Navigate to AllOrdersScreen
                  );
                },
              ),
              const CardWidget(
                  title: "Draft",
                  value: "3.1k",
                  iconPath: "assets/icons/draft.png"),
              const CardWidget(
                  title: "Confirmed",
                  value: "234.1k",
                  iconPath: "assets/icons/confirm.png"),
              const CardWidget(
                  title: "Cancelled",
                  value: "122.3k",
                  iconPath: "assets/icons/cancel.png"),
              const CardWidget(
                  title: "Delivered",
                  value: "3.1k",
                  iconPath: "assets/icons/delivered.png"),
              const CardWidget(
                  title: "Partially Delivered",
                  value: "3.1k",
                  iconPath: "assets/icons/partially-delivered.png"),
              const CardWidget(
                  title: "Rescheduled",
                  value: "234.1k",
                  iconPath: "assets/icons/reschedule.png"),
              const CardWidget(
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
