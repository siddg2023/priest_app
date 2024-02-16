import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                "Last Order",
                style: TextStyle(fontSize: 20),
              ),
            ),
            lastItem(),
            orderItem("Satyanarayan Puja", "Jan 9, 2024", "23.99 CAD"),
            orderItem("Ganesh Puja", "Dec 13, 2023", "67.83 CAD"),
            orderItem("Lakshmi Puja", "Sept 22, 2023", "27.22 CAD"),
            orderItem("Navagraha Puja", "Feb 11, 2023", "23.99 CAD"),
            orderItem("Durga Puja", "Jan 9, 2023", "88.76 CAD"),
          ],
        ),
      ),
    );
  }

  Widget orderItem(itemName, date, price) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 140),
                    child: Text(
                      itemName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(date),
                  Text(price),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Rebook"),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }

  Widget lastItem() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white, // Box background color
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 160,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "lib/images/welcome_file.png"), // Update with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Durga Puja",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Text("Feb 11, 2024"),
              const Text("45.32 CAD"),
              const SizedBox(
                height: 6,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Rebook"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
