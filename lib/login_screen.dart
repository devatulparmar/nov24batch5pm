import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureTextEnable = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // const SizedBox(height: 50),
              // TextField(
              //   // maxLength: 10,
              //   // maxLines: 5,
              //   readOnly: false,
              //   decoration: InputDecoration(
              //     enabled: true,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(35),
              //       gapPadding: 50,
              //       borderSide: const BorderSide(
              //         color: Colors.red,
              //         width: 5,
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(35),
              //       borderSide: const BorderSide(
              //         color: Colors.black,
              //         width: 1,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(35),
              //       borderSide: const BorderSide(
              //         color: Colors.red,
              //         width: 2,
              //       ),
              //     ),
              //     disabledBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(0),
              //       borderSide: const BorderSide(
              //         color: Colors.brown,
              //         width: 0.5,
              //       ),
              //     ),
              //     hintText: "Enter an Email",
              //     hintStyle: const TextStyle(color: Colors.grey, fontSize: 14,),
              //     hintTextDirection:TextDirection.ltr,
              //     hintMaxLines: 3,
              //     // helper: const Icon(Icons.help,),
              //     // helperText: "This is a helper text.",
              //     // helperStyle: const TextStyle(color: Colors.grey, fontSize: 14,),
              //     // helperMaxLines: 3,
              //     // label: const Icon(Icons.email,),
              //     // labelText: "Email",
              //     // labelStyle: const TextStyle(color: Colors.grey, fontSize: 14,),
              //     icon: const Icon(Icons.email,),
              //     iconColor: Colors.red,
              //     prefixIcon: const Icon(Icons.email,),
              //     prefixIconColor: Colors.blue,
              //     // prefixText: "Hello",
              //     // prefixStyle: const TextStyle(color: Colors.grey, fontSize: 14,),
              //     // prefix:const Icon(Icons.email, color: Colors.green,),
              //     // suffix: const Icon(Icons.email, color: Colors.green,),
              //     suffixIcon: const Icon(Icons.remove_red_eye,),
              //     suffixIconColor: Colors.blue,
              //     suffixText: "Hello",
              //     suffixStyle: const TextStyle(color: Colors.grey, fontSize: 14,),
              //   ),
              // ),
              // const SizedBox(height: 50),
              // TextField(
              //   controller: emailController,
              //   keyboardType: TextInputType.emailAddress,
              //   textInputAction: TextInputAction.next,
              //   onChanged: (value) {
              //     setState(() {});
              //   },
              //   onTapOutside: (value) {
              //     FocusScope.of(context).unfocus();
              //   },
              //   decoration: InputDecoration(
              //     enabled: true,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(35),
              //       gapPadding: 50,
              //       borderSide: const BorderSide(
              //         color: Colors.red,
              //         width: 5,
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(35),
              //       borderSide: const BorderSide(
              //         color: Colors.black,
              //         width: 1,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(35),
              //       borderSide: const BorderSide(
              //         color: Colors.red,
              //         width: 2,
              //       ),
              //     ),
              //     disabledBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(0),
              //       borderSide: const BorderSide(
              //         color: Colors.brown,
              //         width: 0.5,
              //       ),
              //     ),
              //     hintText: "Enter an Email",
              //     hintStyle: const TextStyle(
              //       color: Colors.grey,
              //       fontSize: 14,
              //     ),
              //     hintTextDirection: TextDirection.ltr,
              //     hintMaxLines: 3,
              //     prefixIcon: const Icon(
              //       Icons.email,
              //     ),
              //     prefixIconColor: Colors.red,
              //   ),
              // ),
              // const SizedBox(height: 20),
              // TextField(
              //   controller: passwordController,
              //   obscureText: isObscureTextEnable,
              //   // obscuringCharacter: "\$",
              //   keyboardType: TextInputType.visiblePassword,
              //   textInputAction: TextInputAction.next,
              //   onChanged: (value) {
              //     setState(() {});
              //   },
              //   onTapOutside: (value) {
              //     FocusScope.of(context).unfocus();
              //   },
              //   decoration: InputDecoration(
              //     enabled: true,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(35),
              //       gapPadding: 50,
              //       borderSide: const BorderSide(
              //         color: Colors.red,
              //         width: 5,
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(35),
              //       borderSide: const BorderSide(
              //         color: Colors.black,
              //         width: 1,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(35),
              //       borderSide: const BorderSide(
              //         color: Colors.red,
              //         width: 2,
              //       ),
              //     ),
              //     disabledBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(0),
              //       borderSide: const BorderSide(
              //         color: Colors.brown,
              //         width: 0.5,
              //       ),
              //     ),
              //     hintText: "Enter a Password",
              //     hintStyle: const TextStyle(
              //       color: Colors.grey,
              //       fontSize: 14,
              //     ),
              //     hintTextDirection: TextDirection.ltr,
              //     hintMaxLines: 3,
              //     prefixIcon: const Icon(Icons.password),
              //     prefixIconColor: Colors.red,
              //     suffixIcon: IconButton(
              //       onPressed: () {
              //         isObscureTextEnable = !isObscureTextEnable;
              //         // if (isObscureTextEnable == true) {
              //         //   isObscureTextEnable = false;
              //         // } else {
              //         //   isObscureTextEnable = true;
              //         // }
              //         setState(() {});
              //       },
              //       icon: Icon(
              //         isObscureTextEnable
              //             ? Icons.remove_red_eye_outlined
              //             : Icons.remove_red_eye,
              //       ),
              //     ),
              //     suffixIconColor:
              //         isObscureTextEnable ? Colors.grey : Colors.red,
              //   ),
              // ),

              const SizedBox(height: 50),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
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
                onChanged: (value) {
                  setState(() {});
                },
                onTapOutside: (value) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  enabled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    gapPadding: 50,
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 50,
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 50,
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    gapPadding: 50,
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.5,
                    ),
                  ),
                  hintText: "Enter an Email",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  hintTextDirection: TextDirection.ltr,
                  hintMaxLines: 3,
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                  prefixIconColor: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              IntlPhoneField(
                decoration: InputDecoration(
                  enabled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    gapPadding: 50,
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 50,
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 50,
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    gapPadding: 50,
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.5,
                    ),
                  ),
                  hintText: "Enter a number",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  hintTextDirection: TextDirection.ltr,
                  hintMaxLines: 3,
                  prefixIcon: const Icon(
                    Icons.phone,
                  ),
                  prefixIconColor: Colors.red,
                ),
                initialCountryCode: 'AU',
                onChanged: (phone) {
                  print(phone.countryISOCode);
                  print(phone.countryCode);
                  print(phone.number);
                  print(phone.completeNumber);
                },
              ),
              // TextFormField(
              //   keyboardType: TextInputType.number,
              //   textInputAction: TextInputAction.next,
              //   maxLength: 10,
              //   onChanged: (value) {
              //     setState(() {});
              //   },
              //   onTapOutside: (value) {
              //     FocusScope.of(context).unfocus();
              //   },
              //   decoration: InputDecoration(
              //     enabled: true,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(35),
              //       gapPadding: 50,
              //       borderSide: const BorderSide(
              //         color: Colors.red,
              //         width: 5,
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(35),
              //       borderSide: const BorderSide(
              //         color: Colors.black,
              //         width: 1,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(35),
              //       borderSide: const BorderSide(
              //         color: Colors.red,
              //         width: 2,
              //       ),
              //     ),
              //     disabledBorder: OutlineInputBorder(
              //       gapPadding: 50,
              //       borderRadius: BorderRadius.circular(0),
              //       borderSide: const BorderSide(
              //         color: Colors.brown,
              //         width: 0.5,
              //       ),
              //     ),
              //     hintText: "Enter a number",
              //     hintStyle: const TextStyle(
              //       color: Colors.grey,
              //       fontSize: 14,
              //     ),
              //     hintTextDirection: TextDirection.ltr,
              //     hintMaxLines: 3,
              //     prefixIcon: const Icon(
              //       Icons.phone,
              //     ),
              //     prefixIconColor: Colors.red,
              //   ),
              // ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: isObscureTextEnable,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
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
                onChanged: (value) {
                  setState(() {});
                },
                onTapOutside: (value) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  enabled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    gapPadding: 50,
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 50,
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 50,
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    gapPadding: 50,
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.5,
                    ),
                  ),
                  hintText: "Enter a Password",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  hintTextDirection: TextDirection.ltr,
                  hintMaxLines: 3,
                  prefixIcon: const Icon(Icons.password),
                  prefixIconColor: Colors.red,
                  suffixIcon: IconButton(
                    onPressed: () {
                      isObscureTextEnable = !isObscureTextEnable;
                      // if (isObscureTextEnable == true) {
                      //   isObscureTextEnable = false;
                      // } else {
                      //   isObscureTextEnable = true;
                      // }
                      setState(() {});
                    },
                    icon: Icon(
                      isObscureTextEnable
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                    ),
                  ),
                  suffixIconColor:
                      isObscureTextEnable ? Colors.grey : Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              Text('Email id is : ${emailController.text}'),
              const SizedBox(height: 20),
              Text('Password is : ${passwordController.text}'),
              ElevatedButton(
                onPressed: () {
                  bool isValidateCompleted = formKey.currentState!.validate();
                  if (isValidateCompleted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Login Success.'),
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.all(10),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        duration: const Duration(seconds: 15),
                        behavior: SnackBarBehavior.floating,
                        // margin: const EdgeInsets.all(20),
                        // showCloseIcon: true,
                        // closeIconColor: Colors.red,
                        action: SnackBarAction(
                          onPressed: (){},
                          label: "Close",
                          textColor: Colors.white,
                        ),
                        // width: 200,

                      ),
                    );
                  } else {
                    print('Validation failed');
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
