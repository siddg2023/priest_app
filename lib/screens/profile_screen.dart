import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;

  const ProfileScreen(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20),
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with your image URL.
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "$firstName $lastName",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(14),
            width: double.infinity,
            child: Column(
              children: [
                profileInfo(),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget profileInfo() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white, // Box background color
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: const Text('Edit Profile'),
              ),
              infoItem('Email', email),
              infoItem('Phone', phone),
              infoItem('Address', address)
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white, // Box background color
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              optionItem(Icons.settings, 'Settings'),
              optionItem(Icons.message, "Messages"),
              optionItem(Icons.card_giftcard, "Promotions"),
              optionItem(Icons.info, "Details")
            ],
          ),
        ),
      ],
    );
  }

  Widget infoItem(description, value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        //const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  Widget optionItem(iconData, text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        children: [
          Icon(iconData),
          const SizedBox(
            width: 12,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
