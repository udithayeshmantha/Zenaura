import 'package:flutter/material.dart';
import 'package:zenaura/screens/login_page.dart';
import 'package:zenaura/screens/signup_page.dart';
import 'package:zenaura/themes/theme.dart';
import 'package:zenaura/widgets/custom_scaffold.dart';
import 'package:zenaura/widgets/welcomepgbuttons.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                          text: 'Welcome to\n',
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w200,
                              color: Colors.white)),
                      TextSpan(
                          text: 'Zenaura',
                          style: TextStyle(
                              fontSize: 55.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ]),
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    const Expanded(
                        child: WelcomePageButtons(
                      ButtonText: 'Sign up',
                      onTap: SignUpPage(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    )),
                    Expanded(
                        child: WelcomePageButtons(
                      ButtonText: 'Log in',
                      onTap: const LoginPage(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
