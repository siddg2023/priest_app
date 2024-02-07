import 'package:flutter/material.dart';
import 'package:priest_app/utils/user_model.dart';

class DisplayUserDetailsScreen extends StatelessWidget {
  final User user;

  const DisplayUserDetailsScreen({Key? key, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Email: ${user.email}'),
              Text('Name: ${user.name}'),
              Text('Address: ${user.address}'),
              // Add more fields as needed
            ],
          ),
        ),
      ),
    );
  }
}
