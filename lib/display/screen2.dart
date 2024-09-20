import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_008/display/screen1.dart';
import 'package:flutter_008/display/user.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
// here i am displaying the info enter in the one page over the next page with the

class SendingScreem extends StatefulWidget {
  SendingScreem({super.key});
  // final textController = TextEditingController();

  @override
  State<SendingScreem> createState() => _SendingScreemState();
}

class _SendingScreemState extends State<SendingScreem> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  late Box<User> userBox;

  void toNextScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ));
  }

  @override
  void initState() {
    super.initState();
    // Open the Hive box
    userBox = Hive.box<User>('userBox');
  }

  void addUser() {
    final String name = nameController.text;
    final String email = emailController.text;

    if (name.isNotEmpty && email.isNotEmpty) {
      final user = User(name, email);
      userBox.add(user); // Save user to Hive box
      nameController.clear();
      emailController.clear();
      setState(() {}); // Refresh UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen2"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(),
                )),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your Name ',
                  border: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 29,
            ),
            ElevatedButton(
                onPressed: () {
                  addUser();
                },
                child: const Text("Add User")),
                SizedBox(height: 15,),
            ElevatedButton(
                onPressed: () {
                  toNextScreen();
                },
                child:const  Text("Displayed data"))
          ],
        ),
      ),
    );
  }
}
