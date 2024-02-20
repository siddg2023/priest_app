import 'package:flutter/material.dart';
import 'package:priest_app/utils/standard_widgets.dart';
//import 'package:priest_app/utils/standard_widgets.dart';
import 'package:priest_app/utils/user_model.dart';

class DisplayUserDetailsScreen extends StatelessWidget {
  final User user;

  const DisplayUserDetailsScreen({Key? key, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(blueLight), // AppBar background color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white, // Body background color
        child: Column(
          children: <Widget>[
            const SizedBox(height: 24),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade300,
              child: Text(
                'Add Picture',
                style: TextStyle(color: Colors.blue.shade800),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'Hello ${user.name}!',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 32),
            _buildInfoField('Name', user.name),
            _buildInfoField('Email', user.email),
            _buildInfoField('Address', user.address),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement edit profile functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  foregroundColor: Colors.white, // Button text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(orangeLight), width: 4),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.orange.shade600, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.orange.shade600, width: 2),
          ),
        ),
        readOnly: true, // Assuming this is a display-only screen
      ),
    );
  }
}
