import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/team_profile.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';


class Rankings extends StatefulWidget {
  @override
  _RankingsState createState() => _RankingsState();
}

class Team{
  String teamName = "";
  int rank, points, teamId;
  Team(this.teamName, this.rank, this.points, this.teamId);

  Team.fromJson(Map<String, dynamic> json)
      : teamName = json['team-name'],
        rank = json['rank'],
        points = json['points'],
        teamId = json['team-id'];
}

class _RankingsState extends State<Rankings> {
  List<Team> _teams = <Team>[]; // List of teams

  Future<List<Team>> fetchTeams() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/teams.json"); 
    final teamsJson = json.decode(data);

    var teams = <Team>[];

    for (var team in teamsJson) {
      teams.add(Team.fromJson(team));
    }

    return teams;
  }

  @override
  void initState() {
    super.initState();
    fetchTeams().then((value) {
      setState(() {
        _teams.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 63, 0, 122),
      appBar: AppBar(
        title: Text(
          "Ranking",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 63, 0, 122),
      ),
      body: Container(
        //height: 600,
        decoration: BoxDecoration(
          color: Colors.grey,
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
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 640,
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeamProfilePage(
                                    teamId: _teams[index].teamId.toString(),
                                  )));
                    },
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
                            child: Image(
                              image: AssetImage('assets/team_logos/' +
                                  _teams[index].teamId.toString() +
                                  '.png'),
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
                          Container(
                            width: 100,
                            child: Text(_teams[index].points.toString()),
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
