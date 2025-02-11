import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nov24batch5pm/repository/api_repository.dart';
import 'package:nov24batch5pm/utils/constants.dart';
import 'package:nov24batch5pm/utils/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureTextEnable = true;
  String userSocialEmail = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  late SharedPreferences _preferences;

  final dio = Dio();

  Future _loginUsingDio() async {
    setState(() {
      isLoading = true;
    });

    final response = await dio.post(
      "https://api.slingacademy.com/v1/sample-data/users?",
      data: FormData.fromMap({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      options: Options(
        headers: {},
        contentType: "application/json",
        followRedirects: false,
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 2),
      ),
      queryParameters: <String, dynamic>{
        "offset": 1,
        "limit": 5,
      },
    );

    var jsonValue = response.data;

    if (response.statusCode == statusCodeOk) {
      setState(() {
        isLoading = false;
      });
      _preferences.setString("token", jsonValue['token']);
      _preferences.setBool(prefIsLogin, true);
      _preferences.setString(prefName, "AD52344SD32");
      _preferences.setInt(prefAge, 28);
      _preferences.setDouble(prefHeight, 5.10);
      _preferences.setStringList(prefEducation, ["MCA", "BCA"]);

      ScaffoldMessenger.of(mainKey.currentContext!).showSnackBar(
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
            onPressed: () {},
            label: "Close",
            textColor: Colors.white,
          ),
          // width: 200,
        ),
      );

      Navigator.pushNamedAndRemoveUntil(
          mainKey.currentContext!, "/", (Route r) => false);
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(mainKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('${jsonValue['error']}'),
          backgroundColor: Colors.red,
          padding: const EdgeInsets.all(10),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          duration: const Duration(seconds: 10),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            onPressed: () {},
            label: "Close",
            textColor: Colors.white,
          ),
          // width: 200,
        ),
      );
    }
  }

  void _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future _handleSignIn() async {
    setState(() => isLoading = true);
    final GoogleSignInProvider googleSignIn = GoogleSignInProvider();
    try {
      final UserCredential userCredential = await googleSignIn.signIn();
      final user = userCredential.user;
      debugPrint('user email is = ${user?.email}');
      if (await GoogleSignIn().isSignedIn()) {
        setState(() {
          userSocialEmail = user!.email!;
        });
        return _loginWithGoogleAPI();
      }
    } catch (error) {
      print(error);
    }
    setState(() => isLoading = false);
  }

  Future _handleSignOut() async {
    setState(() => isLoading = true);
    final GoogleSignInProvider googleSignIn = GoogleSignInProvider();
    try {
      await googleSignIn.signOut();
    } catch (error) {
      print(error);
    }
    setState(() => isLoading = false);
  }

  Future _loginAPI() async {
    setState(() {
      isLoading = true;
    });
    // http.Response response = await http.post(
    //   Uri.parse("https://reqres.in/api/login"),
    //   // headers: {
    //   //   "Content-Type": "application/json",
    //   // },
    //   body: {
    //     "email": emailController.text,
    //     "password": passwordController.text,
    //   },
    // );

    var response = await ApiRepository().postAPICall(
      url: "https://reqres.in/api/login",
      body: {
        "email": emailController.text,
        "password": passwordController.text,
      },
    );
    var jsonValue = jsonDecode(response.body);
    if (response.statusCode == statusCodeOk) {
      setState(() {
        isLoading = false;
      });
      _preferences.setString("token", jsonValue['token']);
      _preferences.setBool(prefIsLogin, true);
      _preferences.setString(prefName, "AD52344SD32");
      _preferences.setInt(prefAge, 28);
      _preferences.setDouble(prefHeight, 5.10);
      _preferences.setStringList(prefEducation, ["MCA", "BCA"]);

      ScaffoldMessenger.of(mainKey.currentContext!).showSnackBar(
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
            onPressed: () {},
            label: "Close",
            textColor: Colors.white,
          ),
          // width: 200,
        ),
      );

      Navigator.pushNamedAndRemoveUntil(
          mainKey.currentContext!, "/", (Route r) => false);
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(mainKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('${jsonValue['error']}'),
          backgroundColor: Colors.red,
          padding: const EdgeInsets.all(10),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          duration: const Duration(seconds: 10),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            onPressed: () {},
            label: "Close",
            textColor: Colors.white,
          ),
          // width: 200,
        ),
      );
    }
  }

  Future _loginWithGoogleAPI() async {
    setState(() {
      isLoading = true;
    });
    var response = await ApiRepository().postAPICall(
      url: "https://reqres.in/api/login",
      body: {
        "email": userSocialEmail,
        "social": "google",
      },
    );
    var jsonValue = jsonDecode(response.body);
    if (response.statusCode == statusCodeOk) {
      setState(() {
        isLoading = false;
      });
      _preferences.setString("token", jsonValue['token']);
      _preferences.setBool(prefIsLogin, true);
      _preferences.setString(prefName, "AD52344SD32");
      _preferences.setInt(prefAge, 28);
      _preferences.setDouble(prefHeight, 5.10);
      _preferences.setStringList(prefEducation, ["MCA", "BCA"]);

      ScaffoldMessenger.of(mainKey.currentContext!).showSnackBar(
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
            onPressed: () {},
            label: "Close",
            textColor: Colors.white,
          ),
          // width: 200,
        ),
      );

      Navigator.pushNamedAndRemoveUntil(
          mainKey.currentContext!, "/", (Route r) => false);
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(mainKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('${jsonValue['error']}'),
          backgroundColor: Colors.red,
          padding: const EdgeInsets.all(10),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          duration: const Duration(seconds: 10),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            onPressed: () {},
            label: "Close",
            textColor: Colors.white,
          ),
          // width: 200,
        ),
      );
    }
  }

  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to leave this page?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Nevermind'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Leave'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        leading: PopScope<Object?>(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, Object? result) async {
            if (didPop) {
              return;
            }
            final bool shouldPop = await _showBackDialog() ?? false;
            if (shouldPop) {
              Navigator.pop(mainKey.currentContext!);
            }
          },
          child: IconButton(
            onPressed: () async {
              final bool shouldPop = await _showBackDialog() ?? false;
              if (context.mounted && shouldPop) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: ListView(
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
                      } else if (!RegExp(r'^(?=.*?[!@#\$&*~])')
                          .hasMatch(value)) {
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
                  const SizedBox(height: 60),
                  Text('Password is : ${passwordController.text}'),
                  ElevatedButton(
                    onPressed: () {
                      bool isValidateCompleted =
                          formKey.currentState!.validate();
                      if (isValidateCompleted) {
                        _loginAPI();
                        // _loginUsingDio();
                      } else {
                        print('Validation failed');
                      }
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _handleSignIn();
                    },
                    child: const Text('Login With Google'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _handleSignOut();
                    },
                    child: const Text('Logout Google'),
                  ),

                  const SizedBox(height: 20),

                  ///Loader Button
                  // ElevatedButton(
                  //   onPressed: () {
                  //     if (formKey.currentState!.validate() == true) {
                  //       _loginAPI();
                  //     } else {
                  //       print('Validation failed');
                  //     }
                  //   },
                  //   child: isLoading
                  //       ? const Padding(
                  //           padding: EdgeInsets.all(10),
                  //           child: Center(
                  //             child: SizedBox(
                  //               height: 25,
                  //               width: 25,
                  //               child: CircularProgressIndicator(
                  //                 color: Colors.red,
                  //                 strokeWidth: 3,
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //       : const Text('Login'),
                  // ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black26,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
