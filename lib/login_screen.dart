import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureTextEnable = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
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
            const SizedBox(height: 50),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
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
            TextField(
              controller: passwordController,
              obscureText: isObscureTextEnable,
              // obscuringCharacter: "\$",
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
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
                suffixIconColor: isObscureTextEnable ? Colors.grey : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            Text('Email id is : ${emailController.text}'),
            const SizedBox(height: 20),
            Text('Password is : ${passwordController.text}'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Go To Next'),
            ),
          ],
        ),
      ),
    );
  }
}
