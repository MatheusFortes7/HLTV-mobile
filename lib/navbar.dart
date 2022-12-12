import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'team_rankings.dart';
import 'profile.dart';
import 'news.dart';
import 'login.dart';
import 'profile.dart';


class MyNavbar extends StatefulWidget {
  const MyNavbar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyNavbarState createState() => _MyNavbarState();
}
/*
class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}
*/

class _MyNavbarState extends State<MyNavbar> with SingleTickerProviderStateMixin {
  int _tabIndex = 1;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.list, color: Colors.orange),
          Icon(Icons.home, color: Colors.orange),
          Icon(Icons.person, color: Colors.orange),
        ],
        inactiveIcons: const [
          Text("Ranking"),
          Text("Home"),
          Text("Perfil"),
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTab: (v) {
          tabIndex = v;
          pageController.jumpToPage(tabIndex);
        },
        padding: const EdgeInsets.only(left: 13, right: 13, bottom: 8),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.orange,
        elevation: 10,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
          Rankings(),
          News(),
          const MyLogin(),
          Profile()
        ],
      ),
    );
  }
}