import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter_application_1/team_rankings.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class News extends StatefulWidget {
  @override
  _News createState() => _News();
}

class Noticias {
  String title = "";
  String description = "";
  String link = "";
  Noticias(this.title, this.description, this.link);

  Noticias.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        link = json['link'];
}

recuperaNoticia() async {
  String url = "https://hltv-api.vercel.app/api/news.json";
  var response = await http.get(Uri.parse(url));
  var noticiaJson = json.decode(response.body);
  List<Noticias> noticias = <Noticias>[];
  for (var noticia in noticiaJson) {
    noticias.add(Noticias.fromJson(noticia));
  }
  return noticias;
}

class _News extends State<News> {
  List<Noticias> _news = <Noticias>[];

  @override
  void initState() {
    super.initState();
    recuperaNoticia().then((value) {
      setState(() {
        _news.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 63, 0, 122),
      appBar: AppBar(
        title: Text(
          "News",
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
                "CS:GO News",
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
                  Uri a;
                  return InkWell(
                    onTap: () async => {
                      a = Uri.parse(_news[index].link),
                      if (await canLaunchUrl(a)) { 
                        launchUrl(a)
                      } else {
                        throw 'Could not launch'           
                      }
                    },
                    child: Card(
                      elevation: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 125,
                            child: Text(
                              _news[index].title,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 200,
                            child: Text(
                              _news[index].description,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _news.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
