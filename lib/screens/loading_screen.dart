import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static const routeName = 'loading_screen';

  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white, // Background color of the loading screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the contents
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.blue), // Color of the loading indicator
            ),
            SizedBox(height: 20), // Spacer
            Text(
              'Loading...', // Loading text
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
