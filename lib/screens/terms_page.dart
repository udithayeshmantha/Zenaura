import 'package:flutter/material.dart';
import 'package:zenaura/moods%20page/neutral_mood_page.dart';
import 'package:zenaura/screens/signup_page.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: const Text('Zenaura Terms and \nConditions',
            style: TextStyle(color: Colors.black, fontSize: 30)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Welcome to Zenaura! These terms and conditions outline the rules and regulations for the use of Zenaura\'s services. By accessing or using our application, you agree to comply with and be bound by these terms. If you disagree with any part of the terms, please do not use our application.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Acceptance of Terms',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'By downloading, installing, or using the Zenaura application, you agree to these Terms and Conditions, our Privacy Policy, and any other legal notices or guidelines provided within the application.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Changes to Terms',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Zenaura reserves the right to modify these terms at any time. Any changes will be effective immediately upon posting the updated terms within the application. It is your responsibility to review these terms periodically. Continued use of the application following any changes constitutes your acceptance of the new terms.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'User Accounts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'To access certain features of the application, you may be required to create a user account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete. You are responsible for safeguarding your account and password and for any activities or actions under your account.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Use of the Application',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Zenaura is intended to provide music and mindfulness activities to help manage stress and depression among students. You agree to use the application only for its intended purpose and in accordance with these terms. Unauthorized use, including but not limited to, infringement of intellectual property or privacy rights, or any illegal activity, is strictly prohibited.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Privacy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your use of the application is also governed by our Privacy Policy, which explains how we collect, use, and protect your information. By using Zenaura, you consent to the collection and use of your information as described in the Privacy Policy.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Intellectual Property',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'The content, design, and technology incorporated within Zenaura are the exclusive property of Zenaura and its licensors. You may not copy, modify, distribute, or create derivative works based on any content, design, or technology from the application without prior written consent from Zenaura.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Limitation of Liability',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'To the fullest extent permitted by applicable law, Zenaura shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use or inability to use the application, even if Zenaura has been advised of the possibility of such damages.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Disclaimer of Warranties',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'The application is provided "as is" and "as available" without any warranties of any kind, either express or implied. Zenaura does not warrant that the application will be uninterrupted, error-free, or free of harmful components.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Governing Law',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'These terms shall be governed and construed in accordance with the laws of Sri Lanka, without regard to its conflict of law provisions.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Contact Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'If you have any questions about these Terms and Conditions, please contact us at:\n\nZenaura Support Team\nEmail: support@zenaura.com',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'By using Zenaura, you acknowledge that you have read, understood, and agree to be bound by these terms and conditions.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle decline action
                      Navigator.pop(context);
                    },
                    child: const Text('Continue'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
