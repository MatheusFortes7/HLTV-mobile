


import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/team_model.dart';

class HttpController extends GetController with StateMixin{
  final TeamModel _httpRepository;

  HttpController(this._httpRepository);

  @override 
  void onInit(){
    super.onInit();
    findUsers();
  }

  Future<void> findUsers() async{
    change([], status: RxStatus.loading());
    try {
  final dados = await _httpRepository.findAllUsers();
  change([], status: RxStatus.success());
} on Exception catch (e) {
  change([], status: RxStatus.error());
}
  }
}