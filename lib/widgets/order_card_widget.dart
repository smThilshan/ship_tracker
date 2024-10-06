import 'package:flutter/material.dart';

class OrderCardWidget extends StatelessWidget {
  final String orderNumber;
  final String status;

  const OrderCardWidget({
    super.key,
    required this.orderNumber,
    required this.status,
  });

  Color _getBadgeColor() {
    switch (status.toLowerCase()) {
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      case 'confirmed':
        return Colors.blue;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  // Method to show modal bottom sheet when the icon is pressed
  void _showOrderDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows for full-screen modal
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'View Order Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildOrderDetailsSection(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOrderDetailsSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Order Info
        Row(
          children: [
            Icon(Icons.shopping_cart, size: 40),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("CF0003034"),
                Text("COD: Rs.250\nWeight: 1kg\nCreated on: 02/06/2023 14:49"),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),

        // Merchant Details
        Text("Merchant Details", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(
            "Iphone Store\nMC-0002\nPickup Address: 280, Duplication Road, Colombo"),
        Text("Origin City: Nugegoda\nOrigin Warehouse: Trans Express"),
        SizedBox(height: 20),

        // Customer Details
        Text("Customer Details", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text("Mr. John Deo\nNugegoda\njohn@gmail.com\n0777678340"),
        Text(
            "Destination City: Colombo 01\nDestination Warehouse: Trans Express"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Order Number on the left
          Text(
            orderNumber,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              // Status Badge in the center
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: _getBadgeColor(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 8), // Spacing between badge and icon
              // Hamburger Icon on the right
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _showOrderDetails(context); // Show modal when pressed
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
