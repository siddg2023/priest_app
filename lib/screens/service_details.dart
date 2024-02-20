import 'package:flutter/material.dart';

class ServiceDetails extends StatelessWidget {
  final String title;
  final String description;

  const ServiceDetails(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Expanded(
              // Wrap with Expanded to fill the available space
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Column(
                  children: [
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Pandits Near You",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 8),
                    gridView()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget personItem(
    String name,
    String mandir,
    double rating,
    int pujaCount,
  ) {
    //List<String> skills) {
    return Flexible(
      child: Card(
        margin: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Align text to the start
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 194, 191, 6),
                  ),
                  Text('$rating/5')
                ],
              ),
              Text(
                mandir,
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                '$pujaCount Pujas',
                style: const TextStyle(fontSize: 12),
              ),

              // ...skills
              //     .map((skill) => Padding(
              //           padding: const EdgeInsets.only(
              //               bottom: 4), // Add some space between skill texts
              //           child: Text(skill),
              //         ))
              //     .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget gridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Disable scrolling inside the grid
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        childAspectRatio: 1 / 1.1, // Adjust based on your content
        crossAxisSpacing: 10, // Spacing between columns
        mainAxisSpacing: 10, // Spacing between rows
      ),
      itemCount: 10, // Number of items in the grid
      itemBuilder: (context, index) {
        // Sample person profiles to populate the grid
        final List<Map<String, dynamic>> personProfiles = [
          {
            'name': 'Ramesh Kumar',
            'mandir': 'Shiva Temple, Varanasi',
            'rating': 4.8,
            'pujaCount': 120,
            'skills': [],
          },
          {
            'name': 'Anil Sharma',
            'mandir': 'Ganesh Mandir, Pune',
            'rating': 4.5,
            'pujaCount': 95,
            'skills': [],
          },
          {
            'name': 'Devi Prasad',
            'mandir': 'Krishna Temple, Mathura',
            'rating': 4.9,
            'pujaCount': 200,
            'skills': [
              'Bhagavad Gita Lectures',
              'Mantra Shastra',
              'Meditation Guidance'
            ],
          },
          {
            'name': 'Arjun Mishra',
            'mandir': 'Durga Mandir, Kolkata',
            'rating': 4.7,
            'pujaCount': 150,
            'skills': [
              'Durga Puja Conducting',
              'Astrology',
              'Youth Spiritual Education'
            ],
          },
          {
            'name': 'Lakshman Das',
            'mandir': 'Hanuman Temple, Delhi',
            'rating': 4.6,
            'pujaCount': 180,
            'skills': [
              'Hanuman Chalisa Recitals',
              'Ayurveda Basics',
              'Life-cycle Rituals'
            ],
          },
          {
            'name': 'Suresh Joshi',
            'mandir': 'Vishnu Temple, Mumbai',
            'rating': 5.0,
            'pujaCount': 250,
            'skills': [
              'Sanskrit Teaching',
              'Vedic Astrology',
              'Interfaith Understanding'
            ],
          },
          {
            'name': 'Devi Prasad',
            'mandir': 'Krishna Temple, Mathura',
            'rating': 4.9,
            'pujaCount': 200,
            'skills': [
              'Bhagavad Gita Lectures',
              'Mantra Shastra',
              'Meditation Guidance'
            ],
          },
          {
            'name': 'Arjun Mishra',
            'mandir': 'Durga Mandir, Kolkata',
            'rating': 4.7,
            'pujaCount': 150,
            'skills': [
              'Durga Puja Conducting',
              'Astrology',
              'Youth Spiritual Education'
            ],
          },
          {
            'name': 'Lakshman Das',
            'mandir': 'Hanuman Temple, Delhi',
            'rating': 4.6,
            'pujaCount': 180,
            'skills': [
              'Hanuman Chalisa Recitals',
              'Ayurveda Basics',
              'Life-cycle Rituals'
            ],
          },
          {
            'name': 'Suresh Joshi',
            'mandir': 'Vishnu Temple, Mumbai',
            'rating': 5.0,
            'pujaCount': 250,
            'skills': [
              'Sanskrit Teaching',
              'Vedic Astrology',
              'Interfaith Understanding'
            ],
          }
        ];

        // Ensure the index is within the range of personProfiles
        final person = personProfiles[index % personProfiles.length];

        return personItem(
          person['name'],
          person['mandir'],
          person['rating'],
          person['pujaCount'],
          //person['skills'],
        );
      },
    );
  }
}
