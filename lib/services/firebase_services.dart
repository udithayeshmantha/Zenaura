import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getTracks(String mood) {
    return _firestore
        .collection('moods')
        .doc(mood)
        .collection('tracks')
        .snapshots();
  }
}
