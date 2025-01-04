import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class SendNotification extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<SendNotification> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  List<String> _targetUserIds = []; // For selecting specific users

  Future<void> _sendNotification() async {
    String title = _titleController.text.trim();
    String message = _messageController.text.trim();

    if (title.isEmpty || message.isEmpty) {
      _showSnackBar('Title and message are required.');
      return;
    }

    try {
      // Add notification to Firestore
      DocumentReference docRef =
          await _firestore.collection('notifications').add({
        'title': title,
        'message': message,
        'target_users': _targetUserIds, // Optional, if targeting specific users
        'sent': false,
        'created_at': FieldValue.serverTimestamp(),
      });

      // Fetch FCM tokens
      List<String> tokens = await _fetchFcmTokens();

      // Send the notification using FCM
      await _sendFcmMessage(tokens, title, message);

      _showSnackBar('Notification sent successfully!');
    } catch (e) {
      _showSnackBar('Error sending notification: $e');
    }
  }

  Future<List<String>> _fetchFcmTokens() async {
    List<String> tokens = [];
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').get();
      for (var doc in querySnapshot.docs) {
        if ((doc.data() as Map?)?.containsKey('fcm_token') ?? false) {
          tokens.add(doc['fcm_token']);
        }
      }
    } catch (e) {
      _showSnackBar('Error fetching FCM tokens: $e');
    }
    return tokens;
  }

  Future<void> _sendFcmMessage(
      List<String> tokens, String title, String message) async {
    const String serverToken = 'YOUR_SERVER_KEY_HERE';
    final Uri url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    for (String token in tokens) {
      await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverToken',
        },
        body: '''
        {
          "to": "$token",
          "notification": {
            "title": "$title",
            "body": "$message"
          }
        }
        ''',
      );
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel - Send Notification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Notification Title'),
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Notification Message'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendNotification,
              child: Text('Send Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
