import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: const Center(
        child: Text(
          'Terms and conditions content goes here',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the signup page
          Navigator.pushNamed(context, '/signup');
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
