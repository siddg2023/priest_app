import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // Make sure this path matches your file structure

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hindu Ceremonies App',
      home: WelcomeScreen(),
    );
  }
}
