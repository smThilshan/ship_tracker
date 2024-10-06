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
              [
                _buildStatCard("No of Orders", "76", Colors.blue),
                _buildStatCard("Delivery Charge", "50371", Colors.pink),
              ],
            ),

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
    padding: const EdgeInsets.all(13),
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
      const SizedBox(height: 10),
      GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
        children: cards,
      ),
      const SizedBox(height: 20),
    ],
  );
}
