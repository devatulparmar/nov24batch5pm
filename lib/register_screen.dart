import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscureTextEnable = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int genderSelection = 0;
  int maritalStatus = 0;
  String maritalStatusString = 'U';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Screen'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == '') {
                  return "Please enter a full name";
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
                hintText: "Enter a full name",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                hintTextDirection: TextDirection.ltr,
                hintMaxLines: 3,
              ),
            ),
            const SizedBox(height: 20),
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
            TextFormField(
              controller: passwordController,
              obscureText: isObscureTextEnable,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value == '') {
                  return "Please enter a password";
                } else if (RegExp(r'^(?=.*?[A-Z])').hasMatch(value) == false) {
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
                suffixIconColor: isObscureTextEnable ? Colors.grey : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: isObscureTextEnable,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value == '') {
                  return "Please enter a password";
                } else if (RegExp(r'^(?=.*?[A-Z])').hasMatch(value) == false) {
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
                hintText: "Confirm Password",
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
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: genderSelection,
                  onChanged: (newValue) {
                    genderSelection = newValue!;
                    setState(() {});
                  },
                ),
                const Text('Male'),
                Radio(
                  value: 1,
                  groupValue: genderSelection,
                  onChanged: (newValue) {
                    genderSelection = newValue!;
                    setState(() {});
                  },
                ),
                const Text('Female'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    value: 0,
                    groupValue: maritalStatus,
                    title: const Text(
                      'Unmarried',
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: const Text('this is subtitle'),
                    contentPadding: EdgeInsets.zero,
                    activeColor: Colors.red,
                    tileColor: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    onChanged: (newValue) {
                      maritalStatus = newValue!;
                      setState(() {});
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    value: 1,
                    groupValue: maritalStatus,
                    title: const Text(
                      'Married',
                      style: TextStyle(fontSize: 16),
                    ),
                    // contentPadding: EdgeInsets.zero,
                    activeColor: Colors.red,
                    subtitle: const Text('this is subtitle'),
                    tileColor: Colors.blue.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    onChanged: (newValue) {
                      maritalStatus = newValue!;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    value: 'U',
                    groupValue: maritalStatusString,
                    title: const Text(
                      'Unmarried',
                      style: TextStyle(fontSize: 16),
                    ),
                    onChanged: (newValue) {
                      maritalStatusString = newValue!;
                      setState(() {});
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    value: 'M',
                    groupValue: maritalStatusString,
                    title: const Text(
                      'Married',
                      style: TextStyle(fontSize: 16),
                    ),
                    onChanged: (newValue) {
                      maritalStatusString = newValue!;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
