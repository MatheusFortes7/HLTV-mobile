import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:http/http.dart' as http;

class Rankings extends StatefulWidget {
  @override
  _RankingsState createState() => _RankingsState();
}

class Team {
  String teamName = "", logo;
  int rank, teamId;
  Team(this.teamName, this.rank, this.teamId, this.logo);

  Team.fromJson(Map<String, dynamic> json)
      : teamName = json['name'],
        rank = json['ranking'],
        teamId = json['id'],
        logo = json['logo'];
}

recuperaTeams() async {
  String url = "https://hltv-api.vercel.app/api/player.json";
  var response = await http.get(Uri.parse(url));
  var teamsJson = json.decode(response.body);
  var teams = <Team>[];
  for (var team in teamsJson) {
    teams.add(Team.fromJson(team));
  }
  return teams;
}

class _RankingsState extends State<Rankings> {
  List<Team> _teams = <Team>[]; // List of teams
/*
  Future<List<Team>> fetchTeams() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/teams.json");
    final teamsJson = json.decode(data);

    var teams = <Team>[];

    for (var team in teamsJson) {
      teams.add(Team.fromJson(team));
    }

    return teams;
  }
*/
  @override
  void initState() {
    super.initState();
    recuperaTeams().then((value) {
      setState(() {
        _teams.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,45, 50, 72),
      appBar: AppBar(
        title: Text(
          "Ranking",
          style: TextStyle(color: Color.fromARGB(255, 243, 101, 33), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255,45, 50, 72),
      ),
      body: Container(
        //height: 600,
        decoration: BoxDecoration(
          color: Color.fromARGB(255,45, 50, 72),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "CS:GO World ranking",
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 640,
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Card(
                      elevation: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 50,
                            child: Text(
                              '#' + _teams[index].rank.toString(),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 70,
                            padding: EdgeInsets.all(10),
                            child: Image.network(
                              _teams[index].logo,
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 150,
                            child: Text(
                              _teams[index].teamName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _teams.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
