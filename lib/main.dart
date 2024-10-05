import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ship_tracker/providers/order_provider.dart';
import 'package:ship_tracker/screens/dashboard_screen.dart';
import 'package:ship_tracker/screens/forgot_password_screen.dart';
import 'package:ship_tracker/screens/login_screen.dart';
import 'package:ship_tracker/screens/order_details_screen.dart';
import 'package:ship_tracker/screens/order_location_tracker_screen.dart';
import 'package:ship_tracker/screens/order_screen.dart';

void main() {
  runApp(const MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

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
        },
        home: DashboardScreen(),
      ),
    );
  }
}
