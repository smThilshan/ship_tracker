import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ship_tracker/screens/dashboard_screen.dart';
import 'package:ship_tracker/screens/forgot_password_screen.dart';
import 'package:ship_tracker/widgets/my_big_btn.dart';
import 'package:ship_tracker/widgets/my_textbox.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final __loginFormKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  bool _isLoading = false;

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    if (!__loginFormKey.currentState!.validate()) {
      // Stop here if form is not valid
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(
            'https://1c87c801-5105-479a-926c-f631d15bdef9.mock.pstmn.io/login'), // Updated URL
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, String>{
            'email': email.text.trim(),
            'password': password.text.trim(),
          },
        ),
      );

      if (response.statusCode == 200) {
        // Assume response body contains a success message or token
        // final message = response.body;
        // print("Success: $message");

        if (_rememberMe) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('email', email.text);
          await prefs.setString('password', password.text);
        }
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        }

        email.clear();
        password.clear();
      } else {
        // Log or handle specific errors returned by API
        final errorMessage = response.body;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      // print("Error: $error");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An error occurred. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "LOGO", // Replace with your logo widget
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                        child: Form(
                          key: __loginFormKey,
                          child: Column(
                            children: [
                              MyTextBox(
                                controller: email,
                                text: "Email",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              MyTextBox(
                                controller: password,
                                text: "Password",
                                isPassword: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _rememberMe = value!;
                                      });
                                    },
                                  ),
                                  const Text(
                                    "Remember Me",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              _isLoading
                                  ? const CircularProgressIndicator()
                                  : MyBigBtn(
                                      text: "Login",
                                      onTap: _login,
                                      // print("print called");
                                      // Add onTap for button action
                                    ),
                              const SizedBox(height: 15),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        ForgotPasswordScreen.routeName);
                                  },
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Image.asset(
                                'assets/images/delivery-image.png', // Replace with your actual image path
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
