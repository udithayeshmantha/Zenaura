import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User History")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(
                'userhistory') // Ensure this matches your Firestore collection
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No history available'));
          }

          var history = snapshot.data!.docs;

          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              var songData = history[index];
              var timestamp = songData['timestamp'] as Timestamp?;
              var date =
                  timestamp != null ? timestamp.toDate() : DateTime.now();

              return ListTile(
                title: Text(songData['song']),
                subtitle: Text(date.toString()), // Format date if needed
              );
            },
          );
        },
      ),
    );
  }
}
