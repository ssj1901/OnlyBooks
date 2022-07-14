import 'package:flutter/material.dart';
import 'package:onlybook/Screens/Profile/SizeConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'HomeScreen App',
              home: ProfileSecond(title: 'Nick Fury'),
            );
          },
        );
      },
    );
  }
}

class ProfileSecond extends StatefulWidget {
  ProfileSecond({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProfileSecondState createState() => _ProfileSecondState();
}

class _ProfileSecondState extends State<ProfileSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
