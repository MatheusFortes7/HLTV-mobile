import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';


class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          
        ),
      ),
    );
  }
}
