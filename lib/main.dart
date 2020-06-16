import 'package:flutter/material.dart';
import 'package:hoolichat/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HooliChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF430092),
        buttonColor: Color(0xFF430092),
      ),
      home: HomeScreen(),
    );
  }
}
