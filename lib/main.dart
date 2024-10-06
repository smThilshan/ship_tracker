import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_tracker/providers/order_provider.dart';
import 'package:ship_tracker/providers/status_provider.dart';
import 'package:ship_tracker/providers/user_provider.dart';
import 'package:ship_tracker/screens/all_orders_screen.dart';
import 'package:ship_tracker/screens/dashboard_screen.dart';
import 'package:ship_tracker/screens/forgot_password_screen.dart';
import 'package:ship_tracker/screens/login_screen.dart';
import 'package:ship_tracker/screens/my_orders_screen.dart';
import 'package:ship_tracker/screens/notification_screen.dart';
import 'package:ship_tracker/screens/order_location_tracker_screen.dart';
import 'package:ship_tracker/screens/status_statistics_screen.dart';

import 'screens/loading_screen.dart';

void main() async {
  // Ensures initialization Firebase
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print(
        "Firebase initialization error: $e"); // Print error if initialization fails
  }

  // Runs the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Provider for the Widget Tree
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => StatusProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // Defining named routes for navigation
          DashboardScreen.routeName: (context) => const DashboardScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          OrderLocationTrackerScreen.routeName: (context) =>
              const OrderLocationTrackerScreen(),
          ForgotPasswordScreen.routeName: (context) =>
              const ForgotPasswordScreen(),
          StatusStatisticsScreen.routeName: (context) =>
              const StatusStatisticsScreen(),
          MyOrdersScreen.routeName: (context) => const MyOrdersScreen(),
          AllOrdersScreen.routeName: (context) => const AllOrdersScreen(),
          LoadingScreen.routeName: (context) => const LoadingScreen(),
          NotificationScreen.routeName: (context) => NotificationScreen(),
        },
        // Setting the initial screen to LoginScreen
        home: const LoginScreen(),
      ),
    );
  }
}
