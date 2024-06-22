import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Image.asset('assets/images/WelcomePage_bg.jpg', fit: BoxFit.cover),
        ],
      ),
    );
  }
}
