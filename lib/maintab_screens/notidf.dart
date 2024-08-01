import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zenaura/Services/firebase_services.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> notifications = [];

  @override
  void initState() {
    super.initState();
    _fetchnotification();
  }

  Future<void> _fetchnotification() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('notifications').get();
      List<QueryDocumentSnapshot> docs = querySnapshot.docs;

      setState(() {
        notifications =
            docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      });
    } catch (e) {
      print('Error fetching notifications: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: Text('Notifications',
            style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black54,
          ),
          notifications.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    var user = notifications[index];
                    return ListTile(
                      title: Text(user['title'] ?? 'No Title',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          )),
                      subtitle: Text(user['message'] ?? 'No Message',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                      trailing: Text(
                          user['created_at']?.toDate().toString() ?? 'No Date',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          )),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
