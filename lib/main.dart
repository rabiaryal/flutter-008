import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_008/contact/user.dart';
import 'package:flutter_008/contact/contact_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 
  await Hive.initFlutter();


  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
  }

 
  if (!Hive.isBoxOpen('contactbox')) {
    await Hive.openBox<User>('contactbox');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hive Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ContactScreen(),
    );
  }
}
