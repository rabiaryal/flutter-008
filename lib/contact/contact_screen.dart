import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_008/contact/contact_card.dart';
import 'package:flutter_008/contact/formpage.dart';
import 'package:flutter_008/contact/search_box.dart';
import 'package:flutter_008/contact/user.dart';
import 'package:hive_flutter/adapters.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  // late Box<User> contactbox;
   late List<User> allUsers;  // List to store all users
  late List<User> filteredUsers; 


    void _filterUsers(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      filteredUsers = allUsers.where((user) {
        final name = user.name.toLowerCase();
        return name.contains(lowerQuery);
      }).toList();
    });
  }


  

  @override
  void initState() {
    super.initState();

  allUsers = Hive.box<User>('contactbox').values.toList();
    filteredUsers = allUsers;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Contacts"),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(bottom: 80),
            children: [
                SearchBox(onSearchChanged: _filterUsers),
              ValueListenableBuilder<Box<User>>(
                valueListenable: Hive.box<User>('contactbox').listenable(),
                builder: (context, box, _) {
                  final users = box.values.toList();
                   users.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
                  return ListView.builder(
                    shrinkWrap: true, // Prevent infinite height error
                    physics: const NeverScrollableScrollPhysics(),
                     itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = filteredUsers[index];
                      return ContactCard(
                        name: user.name,
                        phoneNumber: user.phnNumber,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormPage()),
                );
              },
              child: const Icon(Icons.add_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
