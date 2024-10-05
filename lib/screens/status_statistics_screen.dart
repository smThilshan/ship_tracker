import 'package:flutter/material.dart';

class StatusStatisticsScreen extends StatefulWidget {
  static const routeName = 'status_statistics_screen';

  const StatusStatisticsScreen({super.key});

  @override
  State<StatusStatisticsScreen> createState() => _StatusStatisticsScreenState();
}

class _StatusStatisticsScreenState extends State<StatusStatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Statistics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildStatisticsSection(
              // "Orders Statistics",
              [
                _buildStatCard("No of Orders", "76", Colors.blue),
                _buildStatCard("Delivery Charge", "50371", Colors.pink),
              ],
            ),
            // Statistics Cards

            // _buildStatisticsCard(
            //   title: 'No of Orders',
            //   value: '76',
            //   icon: Icons.list_alt, // Replace with your icon or image
            // ),
            // const SizedBox(height: 16),
            // _buildStatisticsCard(
            //   title: 'Delivery Charge',
            //   value: '50371.50',
            //   icon: Icons.attach_money, // Replace with your icon or image
            //   ratio: '67%',
            // ),
            const SizedBox(height: 16),
            // List of other statistics
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(title: 'Picked Up'),
                  _buildListTile(title: 'Confirmed'),
                  _buildListTile(title: 'Cancelled'),
                  _buildListTile(title: 'Delivered'),
                  _buildListTile(title: 'Partially Delivered'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // Action for "see more"
              },
              child: const Text('see more'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsCard({
    required String title,
    required String value,
    required IconData icon,
    String? ratio,
  }) {
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
      padding: EdgeInsets.all(13),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align items to the start
        children: [
          // Left side icon
          SizedBox(
            width: 40, // Adjust width as necessary
            child: Image.asset(
              "assets/icons/orders-count.png",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 16), // Space between icon and text

          // Right side content
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the start
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({required String title}) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_drop_down),
    );
  }
}

Widget _buildStatCard(String title, String value, Color color) {
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
    padding: EdgeInsets.all(13),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: 40,
                  child: Image.asset(
                    "assets/icons/orders-count.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  value,
                  style: TextStyle(
                    color: color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildStatisticsSection(List<Widget> cards) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10),
      GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
        children: cards,
      ),
      SizedBox(height: 20),
    ],
  );
}
