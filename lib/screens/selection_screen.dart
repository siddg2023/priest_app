import 'package:flutter/material.dart';
import 'user_details_screen.dart';
import 'package:priest_app/utils/database_utils.dart';
import 'package:priest_app/utils/user_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding:
                      EdgeInsets.only(top: 10.0), // Adjust padding as needed
                  child: Text(
                    "Pandit Finder",
                    style: TextStyle(
                      color: Colors
                          .orange, // Choose color that contrasts with the background
                      fontSize: 50.0, // Adjust font size as needed
                      fontWeight:
                          FontWeight.bold, // Adjust font weight as desired
                    ),
                  ),
                ),
                Image.asset("lib/images/signup_image.png"),
                const SizedBox(
                    height:
                        20.0), // Spacing between illustration and text fields

                // Email TextField
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Your Email',
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0), // Spacing between text fields

                // Password TextField
                TextField(
                  obscureText: true, // Makes it suitable for password entry
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                    height: 24.0), // Spacing before the signup button

                // Signup Button
                ElevatedButton(
                  onPressed: () async {
                    // Assuming you have validated your inputs
                    var email =
                        'user@example.com'; // Get this from your TextField
                    var password =
                        'userpassword'; // Get this from your TextField
                    // Consider hashing the password before storing it for better security

                    // Assuming name and address are also collected from the user, for now, let's use placeholders
                    var name =
                        "User Name"; // Placeholder, replace with actual input from user
                    var address =
                        "User Address"; // Placeholder, replace with actual input from user

                    // Create a User object with the collected data
                    User newUser = User(
                      email: email,
                      password: password,
                      name: name,
                      address: address,
                    );

                    // Inserting the user into the database
                    await DatabaseHelper.instance.insertUser(newUser);

                    if (mounted) {
                      // Check if the widget is still in the widget tree
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailsScreen(
                            email: email,
                            password: password,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFFF9933), // Text color
                    backgroundColor: Colors.white, // Background color
                    minimumSize: const Size(double.infinity, 50), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('SIGNUP'),
                ),

                const SizedBox(height: 24.0), // Spacing after the signup button

                // Switch to Sign In
                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const UserDetailsScreen()),
                    // );
                  },
                  child: const Text(
                    'Already have an Account? Sign In',
                    style: TextStyle(color: Color(0xFFFF9933)),
                  ),
                ),
                // ... Additional UI elements go here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
