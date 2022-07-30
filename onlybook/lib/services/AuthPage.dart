import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:onlybook/Screens/Login/login_screen.dart';
import 'package:onlybook/Screens/Signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(onClickedSignUp: toggle)
      : SignUpScreen(onClickedSignIn: toggle);

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
