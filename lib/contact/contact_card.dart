import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  
  const ContactCard({super.key, required this.name, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    // String firstLetter = name[0].toUpperCase();
     String firstLetter = name.isNotEmpty ? name[0].toUpperCase() : '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Card(
    
        child: ListTile(
          leading:  CircleAvatar(
            radius: 20,
            // You can specify a radius
            child: Text(firstLetter), // Initial of the name
          ),
          title: Text(name),
          subtitle: Text(phoneNumber),
        ),
      ),
    );
  }
}
