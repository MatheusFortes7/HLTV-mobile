// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

  
class PlayerTypes {
    String image;
    String nickname;
    String name;
    String age;
    String rating;
    String impact;
    String dpr;
    String adr;
    String kast;
    String kpr;
    String headshots;
    String mapsPlayed;

    PlayerTypes({
      this.image,
      this.nickname,
      this.name,
      this.age,
      this.rating,
      this.impact,
      this.dpr,
      this.adr,
      this.kast,
      this.kpr,
      this.headshots,
      this.mapsPlayed
    });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'nickname': nickname,
      'name': name,
      'age': age,
      'rating': rating,
      'impact': impact,
      'dpr': dpr,
      'adr': adr,
      'kast': kast,
      'kpr': kpr,
      'headshots': headshots,
      'mapsPlayed': mapsPlayed,
    };
  }

  factory PlayerTypes.fromMap(Map<String, dynamic> map) {
    return PlayerTypes(
      image: map['image'] as String,
      nickname: map['nickname'] as String,
      name: map['name'] as String,
      age: map['age'] as String,
      rating: map['rating'] as String,
      impact: map['impact'] as String,
      dpr: map['dpr'] as String,
      adr: map['adr'] as String,
      kast: map['kast'] as String,
      kpr: map['kpr'] as String,
      headshots: map['headshots'] as String,
      mapsPlayed: map['mapsPlayed'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerTypes.fromJson(String source) => PlayerTypes.fromMap(json.decode(source) as Map<String, dynamic>);
  }
 
  
  