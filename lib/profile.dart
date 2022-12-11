import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';


class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  
  @override
Widget profile() {
  return new Scaffold(body:
    Column(
      children: [
        new Expanded(child:
        Container(
          height: 230,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(200, 40),
                bottomRight: Radius.elliptical(200, 40)
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Perfil",
              style: GoogleFonts.varelaRound(fontSize: 60, color: Colors.white),
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
            ],),
        ),
        listTile(Icons.mail, "julio@gmail.com"),
        listTile(Icons.password, "********"),
      ],
    ),
  );
}
Widget listTile(IconData icon, String title) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(50,0,50,30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          tileColor: Colors.white,
          leading:
          Icon(
            icon,
            color: Colors.teal,),
          title: Text(title),
          trailing:
            Icon(
              Icons.edit,
              color: Colors.yellow,
            ),
        ),
      )
  );
}
  }
}
