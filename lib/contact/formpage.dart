import 'package:flutter/material.dart';
import 'package:flutter_008/contact/contact_screen.dart';
import 'package:hive/hive.dart';
import 'package:flutter_008/contact/universaltextform.dart';
import 'package:flutter_008/contact/buttom.dart';
import 'package:flutter_008/contact/user.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  late Box<User> contactbox;

  @override
  void initState() {
    super.initState();

    // Access the already opened box
    contactbox = Hive.box<User>('contactbox');
  }

  void toNextScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ContactScreen(),
        ));
  }

  void addUser() {
    final String name = nameController.text;
    final String email = emailController.text;
    final String phoneNum = phoneController.text;
    final String address = addressController.text;

    if (name.isNotEmpty &&
        email.isNotEmpty &&
        phoneNum.isNotEmpty &&
        address.isNotEmpty) {
      final user = User(name, phoneNum, email, address);
      contactbox.add(user);
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      addressController.clear();
      setState(() {});
    }

    toNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Add a User"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UniversalTextFormField(
              controller: nameController,
              hintText: 'Enter Your Name',
              inputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            UniversalTextFormField(
              controller: phoneController,
              hintText: 'Phone Number',
              inputType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            UniversalTextFormField(
              controller: emailController,
              hintText: 'Email',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            UniversalTextFormField(
              controller: addressController,
              hintText: 'Address',
              inputType: TextInputType.streetAddress,
            ),
            RoundButton(
              title: "Save",
              onTap: addUser,
            ),
          ],
        ),
      ),
    );
  }
}
