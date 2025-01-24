import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:nov24batch5pm/utils/common_snackbar.dart';
import 'package:nov24batch5pm/utils/constants.dart';
import 'package:nov24batch5pm/utils/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String? dropDownSelectedCityValue;
  bool isTermsAndConditionAccepted = false;
  bool isWhatsAppUpdatesEnable = false;
  List<String> cityNamesListObject = [
    "Vadodara",
    "Ahmedabad",
    "Surat",
    "Rajkot"
  ];
  XFile? selectedImage;
  double ageSliderValue = 18;
  List<XFile?> selectedMultiImage = [];
  String dateOfBirth = '';

  List<DropdownMenuItem> cityList = const [
    DropdownMenuItem(
      value: 'Vadodara',
      child: Text('Vadodara'),
    ),
    DropdownMenuItem(
      value: 'Ahmedabad',
      child: Text('Ahmedabad'),
    ),
    DropdownMenuItem(
      value: 'Rajkot',
      child: Text('Rajkot'),
    ),
    DropdownMenuItem(
      value: 'Gandhinagar',
      child: Text('Gandhinagar'),
    ),
  ];

  void _openUrl() async {
    var url = Uri.parse('utter.dev/');
    if (await canLaunchUrl(url) == true) {
      launchUrl(url, mode: LaunchMode.platformDefault);
    } else {
      MySnackBar.showMySnackBar(
        content: "Can not launch URL",
        backgroundColor: Colors.red,
      );
    }
  }

  String? _encodeQueryParameters(Map<String, String> object) {
    return object.entries
        .map((MapEntry<String, String> element) =>
            '${Uri.encodeComponent(element.key)}=${Uri.encodeComponent(element.value)}')
        .join('&');
  }

  void _openEmail() async {
    var url = Uri(
      scheme: "mailto",
      path: "info@mayursoftware.in",
      query: _encodeQueryParameters(<String, String>{
        "subject": "This is subject",
        "body": "This is body part",
      }),
    );

    launchUrl(url);
  }

  void _openSMS() {
    var number = Uri(scheme: "sms", path: "+919876543210", queryParameters: {
      "body": "Hello, How are you?",
    });

    launchUrl(number);
  }

  void _openPhone() async {
    var phone = Uri(
      scheme: "tel",
      path: "+919876543210",
    );

    launchUrl(phone);
  }

  bool _validateRegisterForm() {
    if (formKey.currentState!.validate()) {
      if (genderSelection == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select Gender.'),
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(10),
            elevation: 10,
            duration: Duration(seconds: 2),
          ),
        );
      } else if (maritalStatus == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select Marital Status.'),
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(10),
            elevation: 10,
            duration: Duration(seconds: 2),
          ),
        );
      } else if (dropDownSelectedCityValue == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select City.'),
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(10),
            elevation: 10,
            duration: Duration(seconds: 2),
          ),
        );
      } else if (isTermsAndConditionAccepted == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please Accept Terms And Condition.'),
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(10),
            elevation: 10,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        return true;
      }
    }
    return false;
  }

  void _pickImageFromGallery() async {
    selectedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      requestFullMetadata: true,
    );
    setState(() {});
  }

  void _pickImageFromCamera() async {
    selectedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );
    setState(() {});
  }

  void _pickMultipleImagesFromGallery() async {
    var images = await ImagePicker().pickMultiImage(
      imageQuality: 100,
      limit: 3,
    );
    selectedMultiImage.clear();

    /// Temp solution for Android limit select images
    // for (int i = 0; i < 3; i++) {
    //   selectedMultiImage.add(images[i]);
    // }
    selectedMultiImage.addAll(images);
    setState(() {});
  }

  void _pickDateFromCalender() async {
    var date = await showDatePicker(
        context: context,
        firstDate: DateTime(1970),
        lastDate: DateTime(
          DateTime.now().year - 18,
          DateTime.now().month,
          DateTime.now().day,
        ),
        initialDate: DateTime(
          DateTime.now().year - 18,
          DateTime.now().month,
          DateTime.now().day,
        ),
        barrierDismissible: true,
        initialEntryMode: DatePickerEntryMode.calendarOnly);
    if (date != null) {
      var formatedDate = DateFormat("dd/MM/yyyy").format(date); // 16-12-2006
      dateOfBirth = formatedDate.toString();
      setState(() {});
    }
  }


  Future _handleSignOut() async {
    final GoogleSignInProvider googleSignIn = GoogleSignInProvider();
    try {
      await googleSignIn.signOut();
    } catch (error) {
      print(error);
    }
  }

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
            selectedImage == null
                ? GestureDetector(
                    onTap: _pickImageFromCamera,
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(img3),
                    ),
                  )
                : GestureDetector(
                    onTap: _pickImageFromGallery,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: FileImage(
                        File(selectedImage!.path),
                      ),
                    ),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickMultipleImagesFromGallery,
              child: const Text('Select Multiple Images'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: selectedMultiImage.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(
                      File(selectedMultiImage[index]!.path),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
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
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Age'),
            ),
            Slider(
              value: ageSliderValue,
              max: 100,
              divisions: 100,
              min: 18,
              label: ageSliderValue.round().toString(),
              allowedInteraction: SliderInteraction.tapAndSlide,
              secondaryActiveColor: Colors.red,
              onChanged: (double newValue) {
                ageSliderValue = newValue;
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text('Birthdate: $dateOfBirth'),
                IconButton(
                  onPressed: _pickDateFromCalender,
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: CupertinoDatePicker(
                onDateTimeChanged: (date) {
                  var formatedDate = DateFormat("dd/MM/yyyy").format(date);
                  dateOfBirth = formatedDate.toString();
                  setState(() {});
                },
                mode: CupertinoDatePickerMode.date,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: genderSelection,
                  onChanged: (newValue) {
                    genderSelection = newValue!;
                    setState(() {});
                  },
                ),
                const Text('Male'),
                Radio(
                  value: 2,
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
                    value: 1,
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
                    value: 2,
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.black),
              ),
              child: DropdownButton(
                hint: const Text('Select City'),
                value: dropDownSelectedCityValue,
                icon: const Icon(Icons.arrow_downward),
                borderRadius: BorderRadius.circular(35),
                isExpanded: true,
                isDense: false, // for button height
                underline: const SizedBox.shrink(),
                items: cityNamesListObject
                    .map(
                      (dynamic item) => DropdownMenuItem(
                        value: item,
                        child: Text(item.toString()),
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  dropDownSelectedCityValue = newValue!.toString();
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: isTermsAndConditionAccepted,
                  onChanged: (newValue) {
                    isTermsAndConditionAccepted = newValue!;
                    setState(() {});
                  },
                ),
                const Text('Accept all Terms and Conditions.'),
              ],
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              value: isTermsAndConditionAccepted,
              title: const Text('Accept all Terms and Conditions.'),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              dense: true,
              subtitle: GestureDetector(
                onTap: () {
                  print('clicked');
                  _openUrl();
                },
                onLongPress: () {
                  print('onLongPress clicked');
                },
                onDoubleTap: () {
                  print('onDoubleTap clicked');
                },
                child: Text(
                  'read Terms and Conditions',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              // tristate: true,
              onChanged: (newValue) {
                isTermsAndConditionAccepted = newValue!;
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                print('inkwell on tap clicked');
              },
              onLongPress: () {
                print('inkwell onLongPress clicked');
              },
              onDoubleTap: () {
                print('inkwell onDoubleTap clicked');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'read new Terms and Conditions',
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Add me to WhatsApp Updates'),
                SizedBox(
                  height: 25,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Switch(
                      value: isWhatsAppUpdatesEnable,
                      activeColor: Colors.green,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (newValue) {
                        isWhatsAppUpdatesEnable = newValue;
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_validateRegisterForm()) {
                  print('success');
                  // APi call
                }
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openEmail,
              child: const Text('Contact us on Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openSMS,
              child: const Text('Contact us on Message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openPhone,
              child: const Text('Contact us on Phone'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint('logout clicked');
                _handleSignOut();
              },
              child: const Text('Logout Google'),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
