import 'package:flutter/material.dart';
// import 'package:zenaura/screens/welcome_page.dart';
import 'package:zenaura/admin/them/them.dart';


import 'admin/adminpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       debugShowCheckedModeBanner: false,
      title: "Zenaura",
      home:  const AdminPage(),
      theme: light,
      darkTheme: dark,
    );
  }
}
