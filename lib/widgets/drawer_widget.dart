import 'package:flutter/material.dart';
import 'package:ship_tracker/screens/dashboard_screen.dart';
import 'package:ship_tracker/screens/my_orders_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Thilshan Doe',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            accountEmail: Text(
              'john.thilshan@example.com',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushNamed(context, DashboardScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('My Orders'),
            onTap: () {
              Navigator.pushNamed(context, MyOrdersScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_sharp),
            title: Text('Logout'),
            onTap: () {
              // logout item action here
            },
          ),
        ],
      ),
    );
  }
}
