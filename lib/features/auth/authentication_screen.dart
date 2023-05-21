import 'package:flutter/material.dart';

import 'signin/signin.dart';
import 'signup/signup.dart';
import 'widgets/auth_switch_button.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool _showSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 250, 16, 0),
            child: _showSignIn ? const SignIn() : const SignUp(),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: _showSignIn
                  ? const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    )
                  : const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
            ),
          ),
          AuthSwitchButton(
            showSignIn: _showSignIn,
            onTap: () {
              setState(() {
                _showSignIn = !_showSignIn;
              });
            },
          )
        ],
      ),
    );
  }
}
