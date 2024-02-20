import 'package:flutter/material.dart';
import 'package:priest_app/screens/user_details_screen.dart';
import 'package:priest_app/utils/standard_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PUJA CONNECT",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            color:
                Colors.black, // Choose color that contrasts with the background
            fontSize: 45.0, // Adjust font size as needed
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("lib/images/signup_image.png"),

                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, // Text color
                    backgroundColor: const Color.fromARGB(
                        255, 225, 227, 228), // Background color
                    minimumSize: const Size(double.infinity, 60), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/images/google-logo.png',
                        width: 30,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Sign Up With Google',
                        style: TextStyle(
                          fontFamily: "Raleway-SemiBold",
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),

                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, // Text color
                    backgroundColor: const Color.fromARGB(
                        255, 225, 227, 228), // Background color
                    minimumSize: const Size(double.infinity, 60), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/images/apple-logo.png',
                        width: 28,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Sign Up With Apple',
                        style: TextStyle(
                          fontFamily: "Raleway-SemiBold",
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        thickness: 1, // Adjust the thickness of the divider
                        color: Colors.grey, // Adjust the color of the divider
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              8), // Adjust the spacing around the "OR" text
                      child: Text("OR"),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1, // Adjust the thickness of the divider
                        color: Colors.grey, // Adjust the color of the divider
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // Email TextField
                Center(
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: "Raleway-SemiBold",
                      fontSize: 16,
                    ),
                  ),
                ),

                //const SizedBox(height: 10.0), // Spacing between text fields

                // // Password TextField
                // TextField(
                //   obscureText: true, // Makes it suitable for password entry
                //   style: const TextStyle(
                //     fontFamily: "Raleway",
                //     fontWeight: FontWeight.bold,
                //     fontSize: 18,
                //   ),
                //   decoration: InputDecoration(
                //     hintText: 'Password',
                //     prefixIcon: const Icon(Icons.lock),
                //     filled: true,
                //     fillColor: Colors.grey[200],
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(30.0),
                //       borderSide: BorderSide.none,
                //     ),
                //   ),
                // ),
                const SizedBox(
                    height: 10.0), // Spacing before the signup button

                // Signup Button
                ElevatedButton(
                  onPressed: () async {
                    String email = emailController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              //DisplayUserDetailsScreen(user: newUser)),
                              UserDetailsScreen(email: email)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, // Text color
                    backgroundColor: const Color(saffron), // Background color
                    minimumSize: const Size(double.infinity, 60), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: "Raleway-SemiBold",
                      fontSize: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 10.0), // Spacing after the signup button

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
                    style: TextStyle(
                        fontFamily: 'Raleway-ExtraBold', color: Colors.black),
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
