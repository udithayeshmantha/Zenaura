import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ZENAURA",
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromRGBO(100, 61, 144, 1), Colors.purple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
      ),
    );
  }
}
