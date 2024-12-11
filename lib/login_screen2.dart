import 'package:flutter/material.dart';
import 'package:nov24batch5pm/utils/constants.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 35,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Row(
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  final regex = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  bool isValidEmail = regex.hasMatch(value!);
                  if (value == '') {
                    return "Please enter an email";
                  } else if (isValidEmail == false) {
                    return 'Enter a valid email';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return "Please enter a password";
                  } else if (RegExp(r'^(?=.*?[A-Z])').hasMatch(value) ==
                      false) {
                    return "Should contain at least one upper case";
                  } else if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
                    return "Should contain at least one lower case";
                  } else if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
                    return "Should contain at least one digit";
                  } else if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
                    return "Should contain at least one Special character";
                  } else if (!RegExp(r'^.{6,}').hasMatch(value)) {
                    return "Must be at least 6 characters in length.";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, routeGridviewProductsList);
                }
              },
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
