import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServicews {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // SignUp User
  Future<String> signupUser({
    required String email,
    required String password,
    required String name,
    role = "user",
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          role.isNotEmpty) {
        // register user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // add user to your firestore database
        await _firestore.collection("users").doc(cred.user!.uid).set(
          {
            'name': name,
            'uid': cred.user!.uid,
            'email': email,
            'role': role, // Added role field
          },
        );
        res = "success";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // Login User
  Future<Map<String, String>> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    String role = "";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        UserCredential cred = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // fetch user role from Firestore
        DocumentSnapshot userDoc =
            await _firestore.collection("users").doc(cred.user!.uid).get();
        role = userDoc['role'];
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return {'res': err.toString(), 'role': role};
    }
    return {'res': res, 'role': role};
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
