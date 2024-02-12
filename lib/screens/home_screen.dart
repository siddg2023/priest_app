import 'package:flutter/material.dart';
import 'package:priest_app/screens/history_screen.dart';
import 'package:priest_app/screens/profile_screen.dart';
import 'package:priest_app/screens/user_details_screen.dart';

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
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
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
            titleText("Trending Now"),
            horizontalScrollingList(),
            titleText("Recommended"),
            horizontalScrollingList(),
            titleText("Near You"),
            verticalScrollingList()
          ],
        ),
      ),
    );
  }

  Widget horizontalScrollingList() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 240,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  //margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: Text('Pooja ${index + 1}',
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text('Pooja ${index + 1}'),
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
            fontSize: 16, // Adjust the font size as needed
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
              Container(
                width: double.maxFinite,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueAccent,
                ),
                //margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                  child: Text(hinduTempleNames[index],
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(addresses[index]),
            ],
          ),
        );
      },
    );
  }
}
