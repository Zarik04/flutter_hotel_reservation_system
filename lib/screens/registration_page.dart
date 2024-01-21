import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/screens/login_page.dart';
import 'package:flutter_hotel_reservation_system/widget_items/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime? _selectedDate;
  static const MaterialColor mainThemeColor = Colors.deepPurple;
  final _formKey = GlobalKey<FormState>();
  String message = '';
  MaterialColor messageColor = Colors.red;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Registration',
                    style: TextStyle(
                        color: mainThemeColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  hintText: 'First Name',
                  icon: Icons.person_2_rounded,
                  color: mainThemeColor,
                  validatorFunc: (val) {
                    val = val!.trim();
                    if (val == null || val.isEmpty) {
                      return 'Please enter the first name';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                ),
                CustomTextField(
                  hintText: 'Last Name',
                  icon: Icons.person_2_rounded,
                  color: mainThemeColor,
                  validatorFunc: (val) {
                    val = val!.trim();
                    if (val == null || val.isEmpty) {
                      return 'Please enter the last name';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                ),
                CustomTextField(
                  hintText: 'Contact Number',
                  icon: Icons.phone,
                  color: mainThemeColor,
                  validatorFunc: (val) {
                    Pattern pattern = r'^\d{1,15}$';
                    RegExp regex = RegExp(pattern as String);
                    if (!regex.hasMatch(val!)) {
                      val = val.trim();
                      return 'Enter valid phone number';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                ),
                CustomTextField(
                  hintText: 'Passport No',
                  icon: Icons.document_scanner_rounded,
                  color: mainThemeColor,
                  validatorFunc: (String? val) {
                    val = val!.trim();
                    if (val.isEmpty || val == null) {
                      return 'Please enter the passport no';
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                CustomTextField(
                  hintText: 'Email Address',
                  icon: Icons.mail,
                  color: mainThemeColor,
                  validatorFunc: (String? val) {
                    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                    RegExp regex = RegExp(pattern as String);
                    if (!regex.hasMatch(val!)) {
                      return 'Enter valid email';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        hintText: 'Date of Birth',
                        prefixIcon: const Icon(
                          Icons.calendar_today,
                          color: mainThemeColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: _selectedDate != null
                          ? Text(
                              "${_selectedDate!.toLocal()}".split(' ')[0],
                              style: const TextStyle(fontSize: 16),
                            )
                          : const Text(
                              'Select Birth Date',
                              style: TextStyle(fontSize: 16),
                            ),
                    ),
                  ),
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
                ),
                Text(
                  'red',
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
                        'Already have an account ?',
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
                                builder: (context) => const LoginPage()),
                          );
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              Colors.transparent), // To remove after effects
                        ),
                        child: const Text(
                          'Sign In',
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const LoginPage()),
                      // );
                      if (_formKey.currentState!.validate()) {
                        print("correct");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: mainThemeColor, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 30.0),
                      child: Text(
                        'Sign Up',
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
    );
  }
}
