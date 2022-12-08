import 'package:flutter/material.dart';
import 'dart:convert';

class PlayerProfilePage extends StatefulWidget {
  final String playerId;

  PlayerProfilePage({Key? key, required this.playerId}) : super(key: key);
  @override
  _PlayerProfilePageState createState() => _PlayerProfilePageState(playerId);
}

class PlayerProfile {
  String nickname,
      name,
      teamName,
      age,
      playerId,
      teamId,
      rating,
      dpr,
      kast,
      impact,
      adr,
      kpr;

  PlayerProfile(
      this.nickname,
      this.name,
      this.teamName,
      this.age,
      this.playerId,
      this.teamId,
      this.rating,
      this.dpr,
      this.kast,
      this.impact,
      this.adr,
      this.kpr);

  PlayerProfile.fromJson(Map<String, dynamic> player_types)
      : nickname = player_types['nickname'],
        name = player_types['name'],
        teamName = player_types['team-name'],
        age = player_types['age'],
        playerId = player_types['player-id'],
        teamId = player_types['team-id'],
        rating = player_types['rating'],
        dpr = player_types['DPR'],
        kast = player_types['KAST'].substring(0, 4),
        impact = player_types['impact'],
        adr = player_types['ADR'],
        kpr = player_types['KPR'];
}

class _PlayerProfilePageState extends State<PlayerProfilePage> {
  String _playerId;

  _PlayerProfilePageState(this._playerId);

  Future<PlayerProfile?> fetchPlayer(String id) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/player_profiles.json");
    final playersJson = json.decode(data);

    PlayerProfile ?playerProfile;

    print("started fetch");
    for (var player in playersJson) {
      print(player['player-id']);
      if (player['player-id'] == id) {
        print(id + "found !");
        playerProfile = PlayerProfile.fromJson(player);
        break;
      }
    }

    return playerProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 71, 129),
      ),
      body: Container(
        child: FutureBuilder(
          future: this.fetchPlayer(_playerId),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                return getPlayerProfile(snapshot.data!);
            }
          },
        ),
      ),
    );
  }

  List<String> statEntry = ["rating 2.0", "DPR", "KAST", "impact", "ADR", "KPR"];

  Widget getPlayerProfile(PlayerProfile player) {
    List<String> statValue = [
      player.rating,
      player.dpr,
      player.kast,
      player.impact,
      player.adr,
      player.kpr
    ];
    return Container(
      color: Color.fromARGB(255, 0, 71, 129),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Container(
                  width: 180,
                  padding: EdgeInsets.only(left: 10, right: 15),
                  child: Image(
                    image: AssetImage(
                        'assets/player_images/' + player.playerId + '.jpeg'),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 70,
                            height: 50,
                            //padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Image(
                              image: AssetImage(
                                'assets/team_logos/' + player.teamId + '.png',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              player.teamName,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          player.nickname,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      columnElement("Name", player.name),
                      columnElement("Age", player.age)
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              //height: 500,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //height: 100,
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Statistics",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 68, 68, 68),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 300,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(6, (index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: getGradColor(
                                    index, double.parse(statValue[index]))),
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 0, 71, 129).withOpacity(.7),
                                  offset: Offset(0.0, 8.0),
                                  blurRadius: 8.0)
                            ],
                          ),
                          //padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                statEntry[index].toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                statValue[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget columnElement(String entry, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          child: Text(
            entry,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Text(
            value,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  List<List<double>> statsRange = [
    [0.96, 1.13],
    [-0.71, -0.66],
    [66, 73],
    [0.97, 1.13],
    [73, 80],
    [0.66, 0.74]
  ];

  List<Color> gradRed = [Colors.red, Colors.redAccent],
      gradYellow = [Colors.yellow, Colors.yellowAccent],
      gradGreen = [Colors.green, Colors.greenAccent];
  

  List<Color> getGradColor(index, double value) {
    List<double> range = statsRange[index];
    if (index == 1) {
      value = -value;
    }

    if (value < range[0]) {
      return gradRed;
    } else if (value > range[1]) {
      return gradGreen;
    } else {
      return gradYellow;
    }
  }
}
