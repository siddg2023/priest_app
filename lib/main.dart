import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // Make sure this path matches your file structure

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hindu Ceremonies App',
      theme: ThemeData(
        // Primary color for the app
        primaryColor: const Color(0xFFFF9933), // Saffron
        // Accent color for the app (used for buttons, floating action buttons, etc.)
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFFD50000)), // Red
        // Button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2962FF), // Blue for buttons
            foregroundColor: Colors.white, // Text color on buttons
          ),
        ),
        // AppBar theme
        appBarTheme: const AppBarTheme(
          color: Colors.white, // Saffron
          iconTheme: IconThemeData(color: Colors.white),
        ),
        // Text theme
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Color(0xFF138808)), // Green
          bodyLarge: TextStyle(color: Color(0xFF2962FF)), // Blue
        ),
        // Scaffold background color
        scaffoldBackgroundColor:
            const Color.fromARGB(15, 255, 255, 255), // White
      ),
      home: const WelcomeScreen(),
    );
  }
}
