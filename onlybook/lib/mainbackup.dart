import 'dart:collection';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlybook/bottomnavbar.dart';
import 'home.dart';
import 'introbackup.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => Home(),
  // "/profile":(BuildContext context) => ProfilePage(),
};

bool isDark = false;
bool isLogin = false;

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
//  Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool _isDark = true;
  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Color(0XFFEFF3F6),
  );
  ThemeData _dark = ThemeData.dark().copyWith(
    primaryColor: Color(0xFF292D32),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnlyBooks',
      darkTheme: ThemeData.dark(),
      theme: _light,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: isLogin ? Home() : Intro(),
    );
  }
}
