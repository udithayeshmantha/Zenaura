import 'package:flutter/material.dart';
import 'package:zenaura/screens/login_page.dart';
import 'package:zenaura/screens/signup_page.dart';
import 'package:zenaura/widgets/Custom_scaffold.dart';
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
          const Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Expanded(
                        child: WelcomePageButtons(
                      ButtonText: 'Sign up',
                      onTap: SignupPage(),
                    )),
                    Expanded(
                        child: WelcomePageButtons(
                            ButtonText: 'Log in', onTap: LoginPage())),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
