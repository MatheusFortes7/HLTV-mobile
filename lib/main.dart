import 'package:flutter/material.dart';
import 'navbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: MyNavbar(title: "Rankings"),
      debugShowCheckedModeBanner: false,
    );
  }
}
