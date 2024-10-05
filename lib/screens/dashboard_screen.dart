import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = 'dashboard_screen';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildStatisticsSection(
              "Orders Statistics",
              [
                _buildStatCard("Orders Count", "3.1k", Colors.blue),
                _buildStatCard("Total Delivery Charge", "4.8k", Colors.pink),
              ],
            ),
            _buildStatisticsSection(
              "Finance Statistics",
              [
                _buildStatCard("Invoice Value", "234.1k", Colors.green),
                _buildStatCard("Pending Invoice", "122.3k", Colors.yellow),
                _buildStatCard("Paid Invoice", "678.7k", Colors.orange),
                _buildStatCard("Approved Invoice", "101.1k", Colors.lightBlue),
              ],
            ),
            _buildStatusStatistics(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection(String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
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
                    color: color,
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

  Widget _buildStatusStatistics() {
    return Container(
      padding: EdgeInsets.all(16),
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
          Row(
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
            onPressed: () {},
            child: Text(
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
