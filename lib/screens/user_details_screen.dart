import 'package:flutter/material.dart';
import 'package:priest_app/screens/home_screen.dart';
import 'package:priest_app/utils/standard_widgets.dart';

class UserDetailsScreen extends StatefulWidget {
  final String email; // Assuming email is passed from the SignUpScreen

  const UserDetailsScreen({Key? key, required this.email}) : super(key: key);

  @override
  UserDetailsScreenState createState() => UserDetailsScreenState();
}

class UserDetailsScreenState extends State<UserDetailsScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(blueLight),
        title: const Text(
          'Welcome To Puja Connect',
          style: TextStyle(
              fontFamily: "Raleway-Bold",
              fontWeight: FontWeight.normal,
              fontSize: 24,
              color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.3,
                color: const Color(blueLight),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFFe0e1dd),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Card(
                    elevation: 1,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Fill Out Your Details",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          inputField(
                              "First Name", Icons.person, firstNameController),
                          inputField("Last Name", Icons.person_outline,
                              lastNameController),
                          inputField("Phone", Icons.phone, phoneController),
                          inputField("Address", Icons.home, addressController),
                          inputField(
                              "Password", Icons.lock, passwordController),
                          customElevatedButton("Continue")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget inputField(
      String text, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(
              fontFamily: "Raleway", fontWeight: FontWeight.bold),
          prefixIcon: Icon(icon), // Icon for First Name
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded borders
          ),
        ),
      ),
    );
  }

  Widget customElevatedButton(String buttonText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          String firstName = firstNameController.text;
          String lastName = lastNameController.text;
          String phone = phoneController.text;
          String address = addressController.text;
          //String password = addressController.text;

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>

                    //DisplayUserDetailsScreen(user: newUser)),
                    HomeScreen(
                      firstName: firstName,
                      lastName: lastName,
                      phone: phone,
                      address: address,
                      email: widget.email,
                    )),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(saffron), // Button color
          foregroundColor: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Match rounded borders
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 15.0), // Adjust padding to match TextField height
          minimumSize:
              const Size(double.infinity, 50), // Match the TextField size
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
              fontFamily: "Raleway-bold",
              fontWeight: FontWeight.normal,
              fontSize: 20),
        ),
      ),
    );
  }
}
