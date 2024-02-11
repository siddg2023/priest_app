import 'package:flutter/material.dart';
import 'package:priest_app/utils/database_utils.dart'; // Import your DatabaseHelper
import 'package:priest_app/utils/user_model.dart';
import 'package:priest_app/utils/standard_widgets.dart';
import 'home_screen.dart';

class UserDetailsScreen extends StatefulWidget {
  final String email; // Assuming email is passed from the SignUpScreen
  final String password; // Assuming password is passed from the SignUpScreen

  const UserDetailsScreen(
      {Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  UserDetailsScreenState createState() => UserDetailsScreenState();
}

class UserDetailsScreenState extends State<UserDetailsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _useMyLocation = false;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _getUserLocation() {
    // Implement location retrieval logic here
    setState(() {
      _useMyLocation = true;
      // For demo purposes, we're setting a dummy address
      _addressController.text = "123 My Location Address";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(blueLight),
        title: const Text('Fill Out Your Details'),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 16.0),
              CustomTextField(
                hintText: 'Name',
                prefixIcon: Icons.person,
                textController: _nameController,
              ),
              CustomTextField(
                hintText: 'Address',
                prefixIcon: Icons.home,
                textController: _addressController,
              ),
              const SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _useMyLocation,
                    onChanged: (bool? value) {
                      if (value != null) {
                        if (value) {
                          _getUserLocation();
                        } else {
                          setState(() {
                            _useMyLocation = false;
                            _addressController.clear();
                          });
                        }
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: _useMyLocation ? null : _getUserLocation,
                    child: const Text(
                      'Use my location',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  // Create a User instance with collected details
                  User newUser = User(
                    email: widget
                        .email, // Use email passed from the previous screen
                    password: widget
                        .password, // Use password passed from the previous screen
                    name: _nameController.text,
                    address: _addressController.text,
                  );

                  // Save the new user details to the database
                  await DatabaseHelper.instance.insertUser(newUser);

                  // Navigate to the DisplayUserDetailsScreen to show all user details
                  if (mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              //DisplayUserDetailsScreen(user: newUser)),
                              const HomeScreen()),
                    );
                  }
                },
                child: const Text('Save Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
