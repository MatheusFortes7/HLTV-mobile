import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  
    late TextEditingController _emailTextEditingController;
    late TextEditingController _nomeTextEditingController;

  _printDados() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailTextEditingController.text = prefs.getString('email')!;
      _nomeTextEditingController.text = prefs.getString('nome')!;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _nomeTextEditingController = TextEditingController();
    _printDados();
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      body: Column(
        children: [
          new Expanded(
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 162, 0, 255),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 40),
                    bottomRight: Radius.elliptical(200, 40)),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Perfil",
                  style: GoogleFonts.varelaRound(
                      fontSize: 60, color: Colors.white),
                ),
              ),
            ),
            flex: 1,
          ),
          Transform(
            transform: Matrix4.translationValues(0, -70, 0),
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, size: 100),
                ),
              ],
            ),
          ),
          listTile(Icons.mail, _emailTextEditingController.text),
          listTile(Icons.person , _nomeTextEditingController.text),
        ],
      ),
    );
  }

  Widget listTile(IconData icon, String title) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ListTile(
            tileColor: Colors.white,
            leading: Icon(
              icon,
              color: Colors.teal,
            ),
            title: Text(title),
          ),
        ));
  }
}
