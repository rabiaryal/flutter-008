import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final Function(String) onSearchChanged;  // Accept a function to handle search query

  const SearchBox({super.key, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200], 
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.search),
          hintText: "Search...",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          // Call the onSearchChanged function when the text changes
          onSearchChanged(value);
        },
      ),
    );
  }
}
