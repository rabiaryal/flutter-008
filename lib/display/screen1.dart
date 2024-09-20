import 'package:flutter/material.dart';
import 'package:flutter_008/display/screen2.dart';
import 'package:flutter_008/display/user.dart';
import 'package:flutter_008/main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class SecondScreen extends StatelessWidget {
  
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Displaying the data"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Response form the next screen"),
          const SizedBox(
            height: 20,
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  child: ValueListenableBuilder<Box<User>>(
                      valueListenable: Hive.box<User>('UserBox').listenable(),
                      builder: (context, box, _) {
                        final users = box.values.toList();
                        return ListView.builder(
                  
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              final user = users[index];
                              SizedBox(height: 200,);
                              return ListTile(
                                
                                title: Text('Name: ${user.name}'),
                                subtitle: Text('Email: ${user.email}'),
                              );
                            });
                      }),
                )
              ],
            ),
          ),
         
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SendingScreem()));
            },
            child: const Icon(Icons.add_outlined),
          ),
        ],
      ),
    );
  }
}
