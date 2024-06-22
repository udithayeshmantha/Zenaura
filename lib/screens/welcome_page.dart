import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zenaura/widgets/Custom_scaffold.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              child: Container(
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                      text: 'Welcome to\n',
                      style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  TextSpan(text: 'Zenaura')
                ]),
              ),
            ),
          )),
          Flexible(
              child: Container(
            child: const Text('Welcome to Zenaura!'),
          )),
        ],
      ),
    );
  }
}
