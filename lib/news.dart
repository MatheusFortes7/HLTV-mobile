import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/team_profile.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter_application_1/team_rankings.dart';

class News extends StatefulWidget {
  @override
  _News createState() => _News();
}

class _News extends State<News> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Noticias"),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Noticias',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
