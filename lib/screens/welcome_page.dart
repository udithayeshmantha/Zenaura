import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zenaura/widgets/Custom_scaffold.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: Text('Welcome Page'),
    );
  }
}
