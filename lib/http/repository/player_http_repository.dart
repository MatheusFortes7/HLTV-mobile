import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_application_1/model/player_types.dart';
import 'package:flutter_application_1/model/team_model.dart';
import 'package:flutter_application_1/player_profile.dart';
import 'package:http/http.dart' as http;

class PlayerHttpRepository implements TeamModel{
  
  @override
  Future<List<TeamModel>> findAllUsers() async{
      final response = await http.get('https://hltv-api.vercel.app/api/teams.json');
      final List<Map<String, dynamic>> responseMap = jsonDecode(response.body);
      return responseMap.map((resp)=> TeamModel().fromMap(resp)).toList();

     }
    }
    
  

