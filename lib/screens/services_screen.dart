import "package:flutter/material.dart";
import "package:priest_app/utils/standard_widgets.dart";

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pujas = [
      "Griha Pravesh",
      "Nitya Puja",
      "Janmashtami",
      "Diwali Puja",
      "Navratri Puja",
      "Saraswati Puja"
    ];

    var images = [
      "lib/images/deity1-removebg-preview.png",
      "lib/images/deity2-removebg-preview.png",
      "lib/images/deity3-removebg-preview.png",
      "lib/images/deity3-removebg-preview.png",
      "lib/images/deity1-removebg-preview.png",
      "lib/images/deity2-removebg-preview.png",
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(
                fontFamily: "Raleway",
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.count(
              crossAxisCount: 3, // Number of columns
              childAspectRatio: 0.5, // Adjust the aspect ratio of the items
              children: List.generate(6, (index) {
                // Generates 6 widgets to fill the 3 rows and 2 columns
                return Card(
                  child: Center(
                    child: serviceItem(pujas[index], images[index]),
                  ),
                );
              }),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double buttonWidth = (constraints.maxWidth / 2) -
                  4; // 2 buttons, minus the border width for separation
              return ToggleButtons(
                //borderColor: Colors.grey,
                fillColor: const Color(blueDark),
                borderWidth: 2,
                selectedBorderColor: const Color(blueDark),
                selectedColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
                constraints:
                    BoxConstraints.expand(width: buttonWidth, height: 30),
                onPressed: (int index) {
                  // Add your toggle functionality here
                },
                isSelected: const [true, false], // Set height as needed
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text('Home', textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text('Temple', textAlign: TextAlign.center),
                  ),
                ], // Initial selection state
              );
            },
          ),
        )
      ],
    );
  }

  Widget serviceItem(String text, String path) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          //width: 100, // Specify your desired width
          //height: 1, // Specify your desired height
          child: Image.asset(
            path,
            fit: BoxFit
                .contain, // This ensures the image maintains its aspect ratio
          ),
        ),
        // Replace with your asset image path
        Text(
          text,
          style: const TextStyle(
              fontFamily: "Raleway-Bold",
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, // Text color
            backgroundColor:
                const Color(saffron), // Background color/ Button size
            padding: const EdgeInsets.all(0),
          ),
          child: const Text(
            'Book',
          ),
        )
      ],
    );
  }
}
