// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeamModel {
  String id;
  String ranking;
  String name;
  List<PlayerTypes> types;

  TeamModel({
    this.id,
    this.ranking,
    this.name,
  });

   

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ranking': ranking,
      'name': name,
      'types': types.map((x) => x.toMap()).toList(),
    };
  }

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id'] as String,
      ranking: map['ranking'] as String,
      name: map['name'] as String,
      types: List<PlayerTypes>.from((map['types'] as List<int>).map<PlayerTypes>((x) => PlayerTypes.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamModel.fromJson(String source) => TeamModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


