import 'package:flutter/material.dart';
import 'package:ship_tracker/widgets/my_big_btn.dart';
import 'package:ship_tracker/widgets/my_textbox.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = 'forgot_password_screen';

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController =
      TextEditingController(); // Controller for the email input
  final _formKey = GlobalKey<FormState>(); // Key for the form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue, // App bar color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Padding around the content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30), // Spacer
              const Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20), // Spacer
              const Text(
                "Enter your email and we will send you instructions to reset your password.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40), // Spacer
              Form(
                key: _formKey, // Assigning the form key
                child: Column(
                  children: [
                    MyTextBox(
                        controller: emailController,
                        text: "Email"), // Email input field
                    const SizedBox(height: 20), // Spacer
                    const MyBigBtn(
                      text: 'Submit', // Submit button
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
