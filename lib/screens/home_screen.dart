import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:priest_app/utils/standard_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "Hello Siddhant!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            )),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Colors.white,
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
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
        ));
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

  Widget spacing() {
    return const SizedBox(
      height: 10,
    );
  }
}
