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
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // title: const Text("Forgot Password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Enter your email and we will send you instructions to reset your password.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // TextFormField(
                    //   controller: emailController,
                    //   keyboardType: TextInputType.emailAddress,
                    //   decoration: InputDecoration(
                    //     labelText: 'Email',
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter your email';
                    //     } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                    //         .hasMatch(value)) {
                    //       return 'Please enter a valid email';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    MyTextBox(controller: emailController, text: "Email"),
                    const SizedBox(height: 20),
                    MyBigBtn(
                      text: 'Submit',
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
