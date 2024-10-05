import 'package:flutter/material.dart';
import 'package:ship_tracker/screens/forgot_password_screen.dart';
import 'package:ship_tracker/widgets/my_big_btn.dart';
import 'package:ship_tracker/widgets/my_textbox.dart';

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
              Expanded(
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
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
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
                                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      .hasMatch(value)) {
                                    return 'Please enter correct password';
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

                              // SizedBox(
                              //   width: double.infinity,
                              //   child: ElevatedButton(
                              //     onPressed: () {
                              //       // Navigator.pushNamed(context, '/signup');
                              //       // Navigator.pushNamed(
                              //       //     context, HomeScreen.routeName);
                              //     },
                              //     style: ElevatedButton.styleFrom(
                              //       foregroundColor: Colors.white,
                              //       backgroundColor: Colors.blue.shade400,
                              //       padding: const EdgeInsets.all(13),
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(8),
                              //       ),
                              //     ),
                              //     child: const Text(
                              //       'Login',
                              //       style: TextStyle(
                              //         fontFamily: 'OpenSans',
                              //         fontSize: 16,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Gradient Login Button
                              MyBigBtn(
                                text: "Login",
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        ForgotPasswordScreen.routeName);
                                  },
                                  child: const Text(
                                    "Forgot Password ?",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              // Add image here
                              Image.asset(
                                'assets/images/delivery-image.png', // Replace with your actual image path
                                height:
                                    230, // Set height of the image as needed
                                fit: BoxFit
                                    .cover, // Set how the image should be fitted
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
