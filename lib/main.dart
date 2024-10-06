import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_tracker/providers/order_provider.dart';
import 'package:ship_tracker/screens/all_orders_screen.dart';
import 'package:ship_tracker/screens/dashboard_screen.dart';
import 'package:ship_tracker/screens/forgot_password_screen.dart';
import 'package:ship_tracker/screens/login_screen.dart';
import 'package:ship_tracker/screens/my_orders_screen.dart';
import 'package:ship_tracker/screens/order_details_screen.dart';
import 'package:ship_tracker/screens/order_location_tracker_screen.dart';
import 'package:ship_tracker/screens/order_screen.dart';
import 'package:ship_tracker/screens/status_statistics_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase initialization error: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => OrderProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // HomeScreen.routeName: (context) => const HomeScreen(),
          DashboardScreen.routeName: (context) => const DashboardScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          OrderScreen.routeName: (context) => const OrderScreen(),
          OrderDetailsScreen.routeName: (context) => const OrderDetailsScreen(),
          OrderLocationTrackerScreen.routeName: (context) =>
              const OrderLocationTrackerScreen(),
          ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
          StatusStatisticsScreen.routeName: (context) =>
              const StatusStatisticsScreen(),
          MyOrdersScreen.routeName: (context) => const MyOrdersScreen(),
          AllOrdersScreen.routeName: (context) => const AllOrdersScreen()
        },
        home: const LoginScreen(),
      ),
    );
  }
}
