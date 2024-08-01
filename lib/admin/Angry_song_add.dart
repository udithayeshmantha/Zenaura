import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AngrySongAdd extends StatefulWidget {
  const AngrySongAdd({super.key});

  @override
  State<AngrySongAdd> createState() => _TestState();
}

class _TestState extends State<AngrySongAdd> {
  TextEditingController Namecontroller = TextEditingController();
  TextEditingController urlcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Angry Songs',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Song Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: Namecontroller,
              decoration: InputDecoration(
                hintText: 'Enter song name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'URL',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: urlcontroller,
              decoration: InputDecoration(
                hintText: 'Enter URL',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  CollectionReference tracksRef = FirebaseFirestore.instance
                      .collection('moods')
                      .doc('angry')
                      .collection('tracks');
                  tracksRef.add({
                    'title': Namecontroller.text,
                    'url': urlcontroller.text
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
