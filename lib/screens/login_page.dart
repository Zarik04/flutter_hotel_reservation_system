import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/screens/registration_page.dart';
import 'package:flutter_hotel_reservation_system/screens/dashboard.dart';
import 'package:flutter_hotel_reservation_system/services/auth.dart';
import 'package:flutter_hotel_reservation_system/widget_items/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  static const MaterialColor mainThemeColor = Colors.deepPurple;

  String email = '';
  String password = '';
  String message = '';
  MaterialColor messageColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 150.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        'Login Page',
                        style: TextStyle(
                            color: mainThemeColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    CustomTextField(
                      hintText: 'Email Address',
                      icon: Icons.mail,
                      color: mainThemeColor,
                      validatorFunc: (String? val) {
                        Pattern pattern =
                            r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                        RegExp regex = RegExp(pattern as String);
                        if (!regex.hasMatch(val!)) {
                          return 'Enter valid email';
                        } else {
                          return null;
                        }
                      },
                      obscureText: false,
                      changedFunc: (String? val) {
                        email = val!;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      icon: Icons.lock,
                      color: mainThemeColor,
                      validatorFunc: (String? val) {
                        val = val!.trim();
                        if (val == null || val.isEmpty) {
                          return 'Please enter your password';
                        } else if (val.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        return null;
                      },
                      obscureText: true,
                      changedFunc: (String? val) {
                        password = val!;
                      },
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        color: messageColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterPage()),
                              );
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors
                                  .transparent), // To remove after effects
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashboardPage()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side:
                              const BorderSide(color: mainThemeColor, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 30.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: mainThemeColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
