import 'package:flutter/material.dart';
import 'signup_screen.dart';
//import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isVisible = true; // Make the button visible after 1 second
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "lib/images/welcome_file.png"), // Update with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Adjusted for spacing
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60.0), // Adjust padding as needed
              child: Text(
                "Pandit Finder",
                style: TextStyle(
                  color: Colors
                      .white, // Choose color that contrasts with the background
                  fontSize: 50.0, // Adjust font size as needed
                  fontWeight: FontWeight.bold, // Adjust font weight as desired
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(
                  seconds: 1), // Controls the fade in animation duration
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD50000), // Button color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 12.0),
                  ),
                  child: const Text("Continue"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
