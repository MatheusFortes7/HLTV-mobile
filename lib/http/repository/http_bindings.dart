


import 'dart:html';

import 'package:flutter_application_1/http/repository/player_http_repository.dart';
import 'package:flutter_application_1/model/team_model.dart';

class HttpBindings implements Bindings{

  @override 
  void dependencies(){
    Get.put<TeamModel>(PlayerHttpRepository());
    Get.put(HttpController(Get.find()));
  }
}