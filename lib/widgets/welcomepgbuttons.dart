import 'package:flutter/material.dart';

class WelcomePageButtons extends StatelessWidget {
  const WelcomePageButtons({super.key, this.ButtonText, required this.onTap});
  final String? ButtonText;
  final Widget? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => onTap!,
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
