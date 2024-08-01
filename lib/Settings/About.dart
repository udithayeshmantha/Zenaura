import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/home_bg.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Black background with some transparency
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          // Content
          const SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Us',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Zenaura is a meditation music application thoughtfully crafted to support university students facing the challenges of depression and stress. Our mission is to provide a sanctuary of calm and relief through curated music and meditation tracks, tailored to the users current emotional state. At Zenaura, we recognize the diverse needs of our users, offering an inclusive experience accessible to individuals with varying technological proficiencies and disabilities. Our app features intuitive mood-based navigation, with buttons for emotions such as sad, happy, angry, neutral, and more. By selecting a mood, users are guided to a specially designed music list that aligns with their emotional state, helping to alleviate negative feelings and enhance overall well-being. We are committed to promoting self-care and mindfulness. Zenaura encourages regular meditation practices, providing not only music but also guidance on cultivating awareness and presence in daily life. Our goal is to empower users to manage their emotional health, reduce stress, and foster a more balanced, mindful lifestyle. Discover the healing power of music with Zenaura, where every track is a step towards mental clarity and emotional peace. Join us in our journey to create a supportive and nurturing environment for all who seek solace and strength through meditation.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    // Add more content as needed
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
