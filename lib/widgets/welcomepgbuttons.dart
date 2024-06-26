import 'package:flutter/material.dart';

class WelcomePageButtons extends StatelessWidget {
  const WelcomePageButtons(
      {super.key,
      this.ButtonText,
      this.onTap,
      this.color,
      this.style,
      this.textColor});
  final String? ButtonText;
  final Widget? onTap;
  final Color? color;
  final TextStyle? style;
  final Color? textColor;

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
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: color!,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: Text(ButtonText!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor!,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ))),
    );
  }
}
