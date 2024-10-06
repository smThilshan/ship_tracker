import 'package:flutter/material.dart';

class CardContainerWidget extends StatelessWidget {
  static const routeName = 'my_orders_screen'; // Route name for navigation
  final String title; // Title of the card container
  final List<Widget> cards; // List of card widgets to display

  const CardContainerWidget({
    super.key,
    required this.title,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Align children to the start
      children: [
        Text(
          title, // Display the title
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold), // Title style
        ),
        const SizedBox(height: 10), // Space between title and grid
        GridView.count(
          crossAxisCount: 2, // Number of columns in the grid
          shrinkWrap: true, // Allow the grid to shrink to fit content
          physics: const NeverScrollableScrollPhysics(), // Disable scrolling
          crossAxisSpacing: 10, // Space between columns
          mainAxisSpacing: 10, // Space between rows
          childAspectRatio: 3 / 2, // Aspect ratio for each grid item
          children: cards, // List of card widgets
        ),
        const SizedBox(height: 20), // Space below the grid
      ],
    );
  }
}
