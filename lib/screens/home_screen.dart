import 'package:flutter/material.dart';
import 'package:priest_app/screens/history_screen.dart';
import 'package:priest_app/screens/profile_screen.dart';
import 'package:priest_app/screens/service_details.dart';
import 'package:priest_app/screens/user_details_screen.dart';
import 'package:priest_app/utils/standard_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Default index of first screen

  // List of screens for each tab
  final List<Widget> _screens = [
    const HomeScreenDisplay(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];

  var appBarText = ["Hello Siddhant!", "Order History", "My Profile"];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              appBarText[_selectedIndex],
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            )),
        body: _screens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 2,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ));
  }

  Widget spacing() {
    return const SizedBox(
      height: 10,
    );
  }
}

class HomeScreenDisplay extends StatelessWidget {
  const HomeScreenDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            titleText("Services"),
            serviceTab(),
            titleText("Popular"),
            horizontalScrollingList(),
            titleText("Near You"),
            verticalScrollingList()
          ],
        ),
      ),
    );
  }

  Widget serviceContainer(iconData, text) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {},
          child: Ink(
            padding: const EdgeInsets.all(8),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF669bbc)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Icon(
                  iconData,
                  color: Colors.white,
                ),
                const Spacer(),
                Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget serviceTab() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        serviceContainer(Icons.home_filled, "Home"),
        serviceContainer(Icons.people, "Wedding"),
        serviceContainer(Icons.celebration, "Festive"),
        serviceContainer(Icons.stars, "Astrology")
      ],
    );
  }

  Widget horizontalScrollingList() {
    var pujas = [
      "Griha Pravesh",
      "Satyanarayan Puja",
      "Janmashtami",
      "Diwali Lakshmi Puja",
      "Navratri Puja"
    ];
    var pujaSummaries = [
      "Griha Pravesh Puja is a sacred housewarming ceremony performed to ensure health, prosperity, and to ward off negative energies in a new home. It involves Vastu Puja and seeks blessings from deities like Lord Ganesha and Goddess Lakshmi.",
      "Satyanarayan Puja is a religious worship of Lord Vishnu conducted to bring good luck, success, and to overcome obstacles. It is typically performed on full moon days and special occasions, involving stories of Lord Vishnu's benevolence.",
      "Janmashtami celebrates the birth of Lord Krishna, marked by fasting, singing, prayer, and dramatic enactments of Krishna's life. At midnight, the moment of Krishna's birth, devotees perform aarti and offer prayers.",
      "Diwali Lakshmi Puja is conducted during Diwali, the festival of lights, to worship Goddess Lakshmi for wealth, prosperity, and well-being. The puja involves lighting lamps, offering prayers, and distributing sweets.",
      "Navratri Puja spans nine nights dedicated to the worship of Goddess Durga and her nine forms. It includes fasting, chanting, dancing (Garba/Dandiya), and culminates in Dussehra, celebrating the victory of good over evil.",
    ];

    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ServiceDetails(
                                title: pujas[index],
                                description: pujaSummaries[index],
                              )),
                    );
                  },
                  child: Ink(
                    width: 240,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF780000),
                    ),
                    //margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Center(
                      child: Text(pujas[index],
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  pujas[index],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget titleText(String text) => Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20, // Adjust the font size as needed
            fontWeight: FontWeight.w400, // Makes the text bold
            color: Colors.black87, // Change the color as needed
          ),
        ),
      );

  Widget verticalScrollingList() {
    var addresses = [
      '350 Main St, Riverside, CA 23456',
      '277 Pine St, Greenville, FL 12345',
      '282 Main St, Riverside, CA 45678',
      '896 Main St, Greenville, FL 12345'
    ];
    var hinduTempleNames = [
      'Sri Venkateswara Temple',
      'Meenakshi Amman Temple',
      'Akshardham Temple',
      'Virupaksha Temple'
    ];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Ink(
                  width: double.maxFinite,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF588157),
                  ),
                  //margin: const EdgeInsets.symmetric(horizontal: 5),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                hinduTempleNames[index],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(addresses[index]),
            ],
          ),
        );
      },
    );
  }
}
