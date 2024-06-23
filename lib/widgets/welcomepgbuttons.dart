import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zenaura/screens/login_page.dart';

class WelcomePageButtons extends StatelessWidget {
  const WelcomePageButtons({super.key, this.ButtonText});
  final String? ButtonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => const LoginPage(),
          ),
        );
      },
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: Text(ButtonText!,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),
    );
  }
}
