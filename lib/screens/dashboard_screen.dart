import 'package:flutter/material.dart';
import 'package:ship_tracker/screens/notification_screen.dart';
import 'package:ship_tracker/screens/status_statistics_screen.dart';
import 'package:ship_tracker/widgets/card_container_widget.dart';
import 'package:ship_tracker/widgets/card_widget.dart';
import 'package:ship_tracker/widgets/drawer_widget.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = 'dashboard_screen';
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, NotificationScreen.routeName);
            },
          ),
        ],
        centerTitle: true,
      ),
      drawer: const DrawerWidget(), // Navigation drawer
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CardContainerWidget(title: "Order Statistics", cards: [
              CardWidget(
                title: "Orders Count",
                value: "3.1k",
                iconPath: "assets/icons/warehouse.png",
              ),
              CardWidget(
                title: "Total Delivery Charge",
                value: "4.8k",
                iconPath: "assets/icons/delivery.png",
              ),
            ]),
            const CardContainerWidget(title: "Invoice Statistics", cards: [
              CardWidget(
                title: "Invoice Value",
                value: "234.1k",
                iconPath: "assets/icons/invoice.png",
              ),
              CardWidget(
                title: "Pending Invoice",
                value: "112.3k",
                iconPath: "assets/icons/pending-invoice.png",
              ),
              CardWidget(
                title: "Paid Invoice",
                value: "678.7k",
                iconPath: "assets/icons/paid-invoice-value.png",
              ),
              CardWidget(
                title: "Approved Invoice",
                value: "101.1k",
                iconPath: "assets/icons/done.png",
              ),
            ]),
            _buildStatusStatistics(context), // Status statistics section
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStatistics(context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.bar_chart, color: Colors.blue, size: 40),
              SizedBox(width: 10),
              Text(
                "Status Statistics",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                  context,
                  StatusStatisticsScreen
                      .routeName); // Navigate to Status Statistics screen
            },
            child: const Text(
              "Show Details",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
